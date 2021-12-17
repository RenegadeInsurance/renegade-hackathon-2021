import logging

import requests


class WeatherAPI:
    CURRENT_WEATHER_API_ENDPOINT = "http://api.weatherapi.com/v1/current.json"
    FORECAST_WEATHER_API_ENDPOINT = "http://api.weatherapi.com/v1/forecast.json"

    def __init__(self, api_key):
        self.api_key = api_key

    def get_weather_for_location(
            self, location, get_air_quality_index: bool = False, get_alerts: bool = False,
            days: int = None
    ):
        additional_params = {}

        if get_air_quality_index is True:
            additional_params["aqi"] = "yes"
        if get_alerts is True:
            additional_params["alerts"] = "yes"
        if days is not None:
            additional_params["days"] = days

        if additional_params:
            resp = requests.get(self.FORECAST_WEATHER_API_ENDPOINT, params={
                "key": self.api_key,
                "q": location,
                **additional_params
            })
        else:
            resp = requests.get(self.CURRENT_WEATHER_API_ENDPOINT, params={
                "key": self.api_key,
                "q": location,
            })

        if resp.ok:
            try:
                return resp.json()
            except Exception as e:
                logging.error(e)
                return ValueError("Invalid input or Location not found.")
        else:
            raise ValueError("Location Not Found.")
