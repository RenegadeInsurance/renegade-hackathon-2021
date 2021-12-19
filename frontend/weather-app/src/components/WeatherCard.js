import React, {Fragment} from 'react'
import { TiWeatherCloudy, TiWeatherSunny , TiWeatherPartlySunny} from 'react-icons/ti'
import { TiWeatherShower } from 'react-icons/ti'

const WeatherCard = (props) => {
    const data = props.data


    const cloudyIcon = ()=> {
        return (
                <TiWeatherCloudy className='text-3xl'/>
        )
    }

    const rainyIcon =()=> {
        return (
                <TiWeatherShower className='text-3xl'/>
        )
    }

    const clearSkyIcon =()=> {
        return (
                <TiWeatherSunny className='text-3xl'/>
        )
    }

    const mistIcon =()=> {
        return (
                <TiWeatherPartlySunny className='text-3xl'/>
        )
    }



    return (
        <>
        <div className="w-96 bg-color4 h-96 rounded-2xl p-4">
            {
                data != null ? (
                    <Fragment>
                    <div>
                    <p className="text-2xl uppercase inline">{data.name}</p>
                    <p className="text-2xl uppercase inline pl-4">{data.sys.country}</p>
                </div>
                 <div className=" flex flex-row mt-4">
                    <div className="text-4xl inline">{data.main.temp}</div> 
                    <div className=" inline text-base h-10 pl-2 pr-2">o</div> 
                    <div className="inline text-4xl"> C </div>
                 </div>
        
                 <div className="flex flex-row justify-between mt-4">
                    <div className=" flex flex-row">
                        <div className="text-lg inline">Max Temp {data.main.temp_max}</div> 
                        <div className=" inline text-base h-10 -mt-1 pl-1 pr-1">o</div> 
                        <div className="inline text-lg"> C </div>
                    </div>
                    <div className=" flex flex-row ">
                        <div className="text-lg inline">Min Temp {data.main.temp_min}</div> 
                        <div className=" inline text-base h-10 -mt-1 pl-1 pr-1">o</div> 
                        <div className="inline text-lg"> C </div>
                    </div>
                 </div>
                 <div className="flex flex-row justify-between pt-4 ">
                    <div className="text-lg uppercase">{data.weather[0].main}</div>
                    <div className="text-lg">{data.clouds.all}</div>
                                        {
                    (
                    data.weather[0].main == "Clouds") ?
                        cloudyIcon() : data.weather[0].main == "rainny" ?
                        rainyIcon(): data.weather[0].main =="Clear"?
                        clearSkyIcon():  data.weather[0].main =="Mist"?
                        mistIcon(): null
                 }
                 </div>
                 <div>
                     <div className="flex flex-row justify-between uppercase text-lg">
                         <div>Humidity </div>
                         <div className="flex">{data.main.humidity}</div>
                     </div>
                 </div>
                 <div>
                     <div className="flex flex-row justify-between uppercase text-lg">
                         <div> Pressure</div>
                         <div className="flex">{data.main.pressure}</div>
                     </div>
                 </div>

                 <div>
                     <div className="flex flex-row justify-between uppercase text-lg">
                         <div> Wind speed</div>
                         <div className="flex">{data.wind.speed}</div>
                     </div>
                 </div>
                 <div className="flex flex-row justify-center mt-4">
                     <p className="text-xl capitalize mt-4 justify-end font-light opacity-80">Weather Situation {data.weather[0].description}</p>
                 </div>
                </Fragment>
                    
                ): null
            }
        </div>
        </>
    )
}

export default WeatherCard