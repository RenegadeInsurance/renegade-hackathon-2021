import {useQuery} from 'react-query'
import { fetchWeatherByCity } from '../Weatherapi/api'
import {useEffect, useState} from 'react'

const ShowWeather = () => {

    const weather = {
        temp: "",
        temp_max: "",
        temp_min: "",
        name: "",
        country: "",
        weather_description: "",
        weather_main:"",
    }

    const [city, setCity] = useState("Kathmandu")
    const [showWeatherData, setShowWeatherData] = useState(weather)


    useEffect(() =>
    {
        fetchWeather()

    },[city])


    console.log("show weather ", showWeatherData)

    function setData(data)
    {
            setShowWeatherData({...showWeatherData, "temp": data.main.temp});
            setShowWeatherData({...showWeatherData, "temp_max": data.main.temp_max});
            setShowWeatherData({...showWeatherData, "temp_min": data.main.temp_min});
            setShowWeatherData({...showWeatherData, "name": data.name});
            setShowWeatherData({...showWeatherData, "country": data.sys.country});
            setShowWeatherData({...showWeatherData, "weather_desciption": data.weather.description});
            setShowWeatherData({...showWeatherData, "weather_main": data.weather.main});
    }


    function fetchWeather()
    {
        const city = "kathmandu "
        const apiKey = "c5d6b6e3bdff41b10301cec2bd1a5f33"
    
        fetch(
            "https://api.openweathermap.org/data/2.5/weather?q=" +
              city +
              "&units=metric&appid=" +
              apiKey
          )
            .then((response) => response.json())
            .then((data) => setData(data));

            
    }

    // const {data, error, isError } = useQuery(["getWeatherByCity", cityName], fetchWeatherByCity)
    // const weather = useQuery(["getWeatherByCity", cityName], fetchWeatherByCity)
    // console.log("weather data ", weather)

    // if(isError)
    // {
    //     console.log(error)
    // }

    // if(data != null)
    // {
    //     console.log(data)
    // }

    return (
        <>
         <div className="w-96 bg-color4 h-96 rounded-2xl p-4">
            <h1 className="text-3xl">85 C</h1>
         </div>
        </>
        )
}

export default ShowWeather