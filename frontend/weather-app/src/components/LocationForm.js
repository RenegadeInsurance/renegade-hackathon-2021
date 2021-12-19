import { useEffect, useState } from "react"
import React from 'react'
import {useFormik} from 'formik'
import {useQuery} from 'react-query'
import { fetchCountires } from "../CountryApi/api"

const LocationForm = () => {
  
  const test = [
      {title : "State ", inputType : "String"},
      {title : "City", inputType : "String"},
    ]

    const staticInput = [
        {title : "State ", inputType : "String"},
        {title : "City", inputType : "String"},
    ]

  const [formData, setFormData] = useState({"country": ""})
  const inputRef = React.useRef([])
  const [locationList, setLocationList] = useState(test) 

  const countryData = useQuery("getCountries", fetchCountires)

  if(countryData.isError)
  {
      console.log("error exit " , countryData.error)
  } 





  let refCount = 0
  const onSubmit = (e) => {
    e.preventDefault();

    for (let i in inputRef.current) {
      if(inputRef.current[i] != null)
      {
          if (inputRef.current[i].value == "")
          {
            inputRef.current[i].classList.add("red-border")
            inputRef.current[i].focus()
            return
          } else {
            inputRef.current[i].classList.remove("red-border")
          }
      }  
  
    }
    // clearInput()
    // console.log("after data ", formData) 
    //productMutate.mutate({ ...formData,launch_at: utcDateTime, productID: productId, author: user.pk })
    
  }

  const onChange = (e) => { 
    if(e.target.value == "")
    {

    }

    setFormData({ ...formData, [e.target.name]: e.target.value })
    }

    const increaseRefCount = ()=> {
    refCount++
    }

    return (
        <div className="bg-item_list_bg p-8 rounded-lg">
           <form >
            <label className="block capitalize mb-2" htmlFor="country">Country<span className="text-red-600"> *</span></label>
            <input
                             type="text"
                             name="country"
                             onChange={onChange}
                             value= {formData["country"]}
                             ref={(ref) => {
                               inputRef.current[refCount] = ref
                               increaseRefCount()
                             }}
                             className="w-full border-none m-auto h-9 mb-4 border-4 hover:opacity-70 rounded-sm "
                         ></input>
            {/* <select name="country" value={formData["country"]} onChange={onChange} className="p-4">           
                {
                   

                    //TODO 
                 (Array.isArray(countryData.data))?
                 (
                     null
                    // countryData.data.map(country => {
                    //     return (<div>{country}</div>)
                    // })
                    // // countryData.data.map(country => {
                    // //     return (
                    // //         <div>
                    // //             <option value={country}>{country}</option>
                    // //         </div>
                    // //     )
                    // // })
                 ): null
            


                     
            }

            </select> */}
               {
               locationList.map( locationInput => {
               return (
                 <div>
                         <div>
                           <label className="block capitalize mb-2" htmlFor={locationInput.title}>{locationInput.title}<span className="text-red-600"> *</span></label>
                           <input
                             type={locationInput.inputType}
                             name={locationInput.title}
                             onChange={onChange}
                             value= {formData[locationInput.title]}
                             ref={(ref) => {
                               inputRef.current[refCount] = ref
                               increaseRefCount()
                             }}
                             className="w-full m-auto h-9 mb-4 border-4 hover:opacity-70 rounded-sm"
                         ></input></div>
                 </div>
                 )})}
   
                 
               <button
                 type="submit"
                 onClick={onSubmit}
                 className="border-none outline-none hover:opacity-70 focus:outline-none bg-item_list_bg w-full h-10 mt-8">POST</button>
             </form>
   
   
         <style jsx>{`
           .input {
                           color: #ffffff;
                           padding-left: 1rem;
                           -webkit-transition: box-shadow 0.3s;
                           transition: box-shadow 0.3s;
                       }
                       .input:focus {
                           outline-offset: 0px;
                           outline: none;
                           box-shadow: 1px 0.3px 2px 0.1px #111e6c;
                       }
   
             .red-border{
               outline-offset: 0px;
                           outline: none;
                           box-shadow: 1px 0.3px 4px 0.1px red;
             }
         `}</style>
        </div>
    )

}
export default LocationForm