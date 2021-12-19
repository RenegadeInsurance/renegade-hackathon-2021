import Header from '../components/Header'
import { useEffect, useState } from 'react';
import UserForm from './UserForm'
import LocationForm from './LocationForm'
import FloodAssement from './FloodAssesment';
import ShowWeather from './ShowWeather';
import Search from './Search';
import AddedWeather from './AddedWeather';
import { useQuery } from 'react-query';
import { fetchCountires } from '../CountryApi/api';
import AlertUser from './AlertSystem/AlertUser';

export default function HomePage() {
  const [name, setName] = useState("jeevan")
  console.log(name)

  const [lat, setLat] = useState()
  const [long, setLong] = useState()


  const {data, error} = useQuery("country", fetchCountires)

  if(data != null)
  {
    // console.log("country ", data.flat(Infinity))

    // data.forEach( data => {
    //     console.log(data)
    // })
  }
 

  useEffect(()=> {
    navigator.geolocation.getCurrentPosition(function(position) {
      setLat(position.coords.latitude)
      setLong(position.coords.longitude)
      console.log("Latitude is :", position.coords.latitude);
      console.log("Longitude is :", position.coords.longitude);
    });
    displayLocation(lat, long)
  })


  function displayLocation(latitude,longitude){
    // var geocoder;
    // geocoder = new google.maps.Geocoder();
    // var latlng = new google.maps.LatLng(latitude, longitude);

    // geocoder.geocode(
    //     {'latLng': latlng}, 
    //     function(results, status) {
    //         if (status == google.maps.GeocoderStatus.OK) {
    //             if (results[0]) {
    //                 var add= results[0].formatted_address ;
    //                 var  value=add.split(",");

    //                 count=value.length;
    //                 country=value[count-1];
    //                 state=value[count-2];
    //                 city=value[count-3];
    //                 console.log("CITY IS ", city)
    //             }
    //             else  {
    //                 console.log("ADdress not found ")
    //             }
    //         }
    //         else {
    //            console.log( "Geocoder failed due to: " , status);
    //         }
    //     }
    // );
}

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
            <AddedWeather/>          
        </div>

        <div className="p-4 mt-4 w-2/3 pl-32">
          <h1 className="text-5xl mb-8">Personal Information </h1>
          <UserForm/>
        </div>


        <div className="p-4 mt-8 w-2/3 pl-32">
          <h1 className="text-5xl mb-8">Flood Prediction Servery</h1>
          <FloodAssement/>
        </div>


        <div className="p-4 mt-8 w-2/3 pl-32">
          <h1 className="text-5xl mb-8">Alert System </h1>
          <AlertUser/>
        </div>
         


      </>
  
    )
  }