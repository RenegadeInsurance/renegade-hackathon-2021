import Header from '../components/Header'
import { useEffect, useState } from 'react';
import UserForm from './UserForm'
import LocationForm from './LocationForm'
import FloodAssement from './FloodAssesment';
import ShowWeather from './ShowWeather';
import Search from './Search';
import AddWeather from './AddWeather';

export default function HomePage() {
  const [name, setName] = useState("jeevan")
  console.log(name)


  useEffect(()=> {
    console.log(name)
    navigator.geolocation.getCurrentPosition(function(position) {
      console.log("Latitude is :", position.coords.latitude);
      console.log("Longitude is :", position.coords.longitude);
    });
  })


    return (
      <>
        <Header/>

        <Search/>

        <div className="p-4 mt-4 w-full pl-32">
          <h1 className="text-3xl mb-8">Current Weather </h1>
          <ShowWeather/>
        </div>

        <div className="p-4 mt-4 w-full pl-32">
          <h1 className="text-3xl mb-8">Add Weather </h1>
          <div className="flex flex-row w-screen space-x-2">
            <ShowWeather/>
            <AddWeather/>
          </div>
          
        </div>

        <div className="p-4 mt-4 w-2/3 pl-32">
          <h1 className="text-5xl mb-8">Personal Information </h1>
          <UserForm/>
        </div>
        <div className="p-4 mt-4 w-2/3 pl-32">
          <h1 className="text-5xl mb-8">Location Information </h1>
          <LocationForm/>
        </div>

        <div className="p-4 mt-4 w-2/3 pl-32">
          <h1 className="text-5xl mb-8">Flood Prediction Servery</h1>
          <FloodAssement/>
        </div>
         


      </>
  
    )
  }