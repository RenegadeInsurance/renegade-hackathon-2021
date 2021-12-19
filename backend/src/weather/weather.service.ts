import { BadRequestException, Injectable } from '@nestjs/common';
import { ConfigService } from '@nestjs/config';
import axios from 'axios';

@Injectable()
export class WeatherService {
  constructor(private readonly configService: ConfigService) {}

  private baseUrlForGeoTranscoding =
    'http://dataservice.accuweather.com/locations/v1/cities/geoposition/search';
  private baseUrlForCurrentCondition =
    'http://dataservice.accuweather.com/currentconditions/v1';
  private offset = +(50 / 111).toFixed(3);

  async getRegionOriginal({
    latitude,
    longitude,
  }: {
    latitude: number;
    longitude: number;
  }): Promise<any> {
    const api_key = await this.configService.get('API_KEY');
    const { data } = await axios.get(
      `${this.baseUrlForGeoTranscoding}?apikey=${api_key}&q=${latitude},${longitude}`,
    );
    const key = data?.['Key'];
    return await this.getCurrentWeather(key);
  }

  async getRegionNorth(args: {
    latitude: number;
    longitude: number;
  }): Promise<any> {
    try {
      const api_key = await this.configService.get('API_KEY');
      const { data } = await axios.get(
        `${this.baseUrlForGeoTranscoding}?apikey=${api_key}&q=${
          args.latitude + this.offset
        },${args.longitude}`,
      );
      return data?.['Region'];
    } catch (e) {
      console.log(e);
      throw e;
    }
  }

  async getRegionSouth(args: {
    latitude: number;
    longitude: number;
  }): Promise<any> {
    const api_key = await this.configService.get('API_KEY');
    const { data } = await axios.get(
      `${this.baseUrlForGeoTranscoding}?apikey=${api_key}&q=${
        args.latitude - this.offset
      },${args.longitude}`,
    );
    return data?.['Region'];
  }

  async getRegionEast(args: {
    latitude: number;
    longitude: number;
  }): Promise<any> {
    const api_key = await this.configService.get('API_KEY');
    const { data } = await axios.get(
      `${this.baseUrlForGeoTranscoding}?apikey=${api_key}&q=${
        args.latitude + this.offset
      },${args.longitude}`,
    );
    return data?.['Region'];
  }

  async getRegionWest(args: {
    latitude: number;
    longitude: number;
  }): Promise<any> {
    const api_key = await this.configService.get('API_KEY');
    const { data } = await axios.get(
      `${this.baseUrlForGeoTranscoding}?apikey=${api_key}&q=${
        args.latitude - this.offset
      },${args.longitude}`,
    );
    return data?.['Region'];
  }

  async getCurrentWeather(regionCode: string) {
    try {
      console.log('Currnet weather');
      const api_key = await this.configService.get('API_KEY');
      const { data } = await axios.get(
        `${this.baseUrlForCurrentCondition}/${regionCode}?apikey=${api_key}`,
      );
      console.log(data);
      return data;
    } catch (e) {
      console.log(e.response.data);
      throw e;
    }
  }

  async getData({
    latitude,
    longitude,
  }: {
    latitude: number;
    longitude: number;
  }): Promise<any> {
    const region = {
      north: await this.getRegionNorth({ latitude, longitude }),
      south: await this.getRegionSouth({ latitude, longitude }),
      east: await this.getRegionEast({ latitude, longitude }),
      west: await this.getRegionWest({ latitude, longitude }),
      current: await this.getRegionOriginal({ latitude, longitude }),
    };

    console.log('GOT ALL REGIONS');

    const finalData = {
      north: await this.getCurrentWeather(region.north.ID),
      south: await this.getCurrentWeather(region.south.ID),
      east: await this.getCurrentWeather(region.east.ID),
      west: await this.getCurrentWeather(region.west.ID),
    };

    return finalData;
  }
}
