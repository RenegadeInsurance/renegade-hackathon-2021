import {useQuery} from 'react-query'
import { fetchWeatherByCity } from '../Weatherapi/api'
import {Fragment, useEffect, useState} from 'react'
import {TiWeatherCloudy} from 'react-icons/ti'
import {TiWeatherShower} from 'react-icons/ti'
import WeatherCard from './WeatherCard'
import {getIpAddress} from '../utils/ipAddress'

const ShowWeather = () => {

    const cityName = "Lalitpur"

    const {data, isError, error} = useQuery(["getWeatherByCity", cityName], fetchWeatherByCity)
    
    console.log("weather API DAT", data)

    if(isError)
    {
        console.log(error)
    }

    // if(data != null)
    // {
    //     console.log(data)
    // }


    return (
            <WeatherCard data = {data}/>
        )
}

export default ShowWeather