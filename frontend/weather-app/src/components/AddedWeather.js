import { prepareDataForValidation } from 'formik'
import { useState ,Fragment, useEffect} from 'react'
import {GrAddCircle} from 'react-icons/gr'
import {IoMdAddCircle} from 'react-icons/io'
import WeatherCard from './WeatherCard'
import {useQuery} from 'react-query'
import { fetchWeatherByCity, fetchWeatherByCityName } from '../Weatherapi/api'


const AddedWeather = ()=> {

    const [addedWeatherList, setWeatherList]= useState([])
    const [toggle, setToggle] = useState(false)
    const [input, setInput] = useState("")
    const [cityName, setCityName] = useState("")
    const [onlyUnique, setOnlyUnique] = useState([])

    const { data, isError, error} = useQuery(["getWeather", cityName], fetchWeatherByCity)
    

    if(isError)
    {
        alert(error.message)
        console.log("Error ", error)
    }else if(data != null)
    {
        if(data.cod == "404")
        {
            alert("City Not Found ")
            return 
        }
    }

    const onSubmit = () => {

        if(input == "")
        {
           return alert(" Empty Field !")
        }

       
        setCityName(input)
        setToggle(false)
    }

    const onChange =(e) => {
        setInput(e.target.value)
    }



    useEffect(()=> {

        console.log("DATA ", data)
        
        const newArray = [...addedWeatherList, data]
        setWeatherList([...addedWeatherList, data])
        const filtered = newArray.filter( e => e != undefined)
        setOnlyUnique([...new Set(filtered)])
        console.log("only unique", onlyUnique)
    },[data])

    const popUpForm = ()=> {
        return (
         <Fragment >
             <div className="w-screen h-full bg-black bg-opacity-70 fixed top-0 left-0" onClick ={()=> {
                 }}>
                 {formCreate()}
             </div>
         </Fragment>    
        )
    }

    const formCreate = () => {
        return (
            <div className="flex flex-row justify-center items-center ">
                <div className="w-1/2 m-auto h-52 bg-blue_secondary mt-60 rounded-2xl pb-52">
                    <form onSubmit={onSubmit}>
                        <input
                        type="text"
                        value={input}
                        required
                        placeholder="Enter the location "
                        className="w-11/12 ml-8 mt-10 h-14 text-xl border-b-2 bg-transparent rounded-sm focus:outline-none"
                        name="location"
                        onChange={onChange} />

                    
                    </form>
                    <div className="flex flex-row justify-end mt-8 pr-4">
                        <button className="bg-item_list_bg rounded-full pt-2 pb-2 pl-8 pr-8 justify-end items-end" onClick={onSubmit}>ADD</button>
                    </div>
                </div>
            </div>    
        )
    }


    const onClickAdd = () => {
        setToggle(true)
    }
    
    
    return (
        <>
            {toggle? popUpForm(): null}
            <div className="flex flex-row w-screen space-x-2">
                {onlyUnique.map(data => {
                    return (
                        <div>
                            {<WeatherCard data = {data}/>}
                        </div>
                    )
                })}
                <div className="w-96 h-96 bg-color5 rounded-2xl text-white flex items-center hover:opacity-90 cursor-pointer" onClick={onClickAdd}>
                    {/* <GrAddCircle className ="text-8xl text-white" color="white"/> */}
                    <IoMdAddCircle className="text-8xl m-auto"/>
                </div>
            </div>


            <style jsx>
        {`
        .red-border{
            outline-offset: 0px;
						outline: none;
						box-shadow: 0.1px 0.1px 1px 0.1px red;
            background:#FF1414;
            opacity: 0.5;
          }
      .input {
						color: #ffffff;
						padding-left: 1rem;
						-webkit-transition: box-shadow 0.3s;
						transition: box-shadow 0.3s;
					}
          
					.input:focus {
						outline-offset: 1px;
						outline: none;
						box-shadow: 1px 0.3px 2px 0.1px #111e6c;
					}
        `}
      </style>
        </>
        )
}

export default AddedWeather