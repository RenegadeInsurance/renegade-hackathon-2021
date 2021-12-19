import { useState } from "react"
import React from 'react'
import {useFormik} from 'formik'
import {useQuery} from 'react-query'
import { fetchCountires } from "../CountryApi/api"

const UserForm = () => {

  const {data, error, isError, isLoading } = useQuery("country", fetchCountires)


const arr = []
  if(data != null)
  {
    data.forEach(d=> {
      arr.push(d.name)
      // console.log(d.name)
    })
  }

  // console.log(arr)

  
  const test = [
      {title : "First Name", inputType : "text"},
      {title : "Middle Name ", inputType : "text"},
      {title : "Last Name ", inputType : "text"},
      {title : "Age", inputType : "Number"},
      {title : "Phone Number", inputType : "Number"},
      {title : "Email ", inputType : "email"},
      {title : "Country ", inputType : "option", options : ["Nepal", "Germany", "US"]},
      {title : "Gender ", inputType : "radio", values: ["Male", "Female", "Others"]},
      {title : "State ", inputType : "text"},
      {title : "City", inputType : "text"},
    ]

  const [formData, setFormData] = useState({})
  const inputRef = React.useRef([])
  const [userDetailsList, setUseDetailsrList] = useState(test) 


  let refCount = 0


  const onSubmit = (e) => {
    
    e.preventDefault();

    for (let i in inputRef.current) {
      if(inputRef.current[i] != null)
      {
        // Form Validation
        if(inputRef.current[i].type == "email")
        {
          const match = inputRef.current[i].value.toLowerCase()
          .match(
            /^(([^<>()[\]\\.,;:\s@"]+(\.[^<>()[\]\\.,;:\s@"]+)*)|(".+"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$/
            )
          
            if(match == null)
            {
            inputRef.current[i].classList.add("red-border")
            inputRef.current[i].focus()
            alert("Email didn't Match ")
            return
            }
        }


        if(inputRef.current[i].type == "text")
        {
          console.log("type ", typeof inputRef.current[i].value)
          const match = /^([a-z0-9]{5,})$/.test(inputRef.current[i].value)
          
            if(!match)
            {
              inputRef.current[i].classList.add("red-border")
              inputRef.current[i].focus()
              alert("Only Accept Text ")
              return
            }
        }

        if(inputRef.current[i].type == "Number")
        {
          const reg = /^\d+$/;
          const result = reg.test(inputRef.current[i].value)

          if(!result)
          {
            alert("Only Integer Number ")
          }

        }

        // Form Validation  

        if(inputRef.current[i].type == "radio" || inputRef.current[i].type == "option"){
          //No need to check
        }else if (inputRef.current[i].value == "")
          {
            inputRef.current[i].classList.add("red-border")
            inputRef.current[i].focus()
            return
          } else {
            inputRef.current[i].classList.remove("red-border")
          }
      }  
  
    }

    console.log("form data ", formData) 
    // clearInput()
    // console.log("after data ", formData) 
    //productMutate.mutate({ ...formData,launch_at: utcDateTime, productID: productId, author: user.pk })
  }

const onChange = (e) => {

    console.log("name ", e.target.name)  
    console.log("onchange ", e.target.value)  

    setFormData({ ...formData, [e.target.name]: e.target.value })
}

const increaseRefCount = ()=> {
  refCount++
}

const clearInput = ()=> {
  console.log("clearing input ")
  setFormData({})
}


 return (
     <div className="bg-item_list_bg p-8 rounded-lg">
        <form >
            {
            userDetailsList?.map( inputData => {
            return (
              <div>
                {(() => {
                  if (inputData.inputType == "radio") {
                    return (
                      <div className="mt-6 mb-2">
                        <label className="pr-4 mr-2 capitalize mb-2" htmlFor={inputData.title}>{inputData.title}<span className="text-red-600"> *</span></label>
                         {inputData.values?.map( value => {
                           return (
                             <span>

                               {/* {console.log("radio title " , inputData.title)}
                               {console.log("radio title " , inputData.)} */}
                               
                               <input
                                type={inputData.inputType}
                                name={inputData.title}
                                onChange={onChange}
                                value= {value}
                                ref={(ref) => {
                                  inputRef.current[refCount] = ref
                                  increaseRefCount()
                                }}
                                className="bg-red-500 border-4 hover:opacity-70 font-medium focus:border-l-0 mb-6"
                            >
                            
                            </input>
                            <label className="mr-6 ml-2">{value}</label>
                            </span>
                           )
                         })}
                      </div>
                    )
                  } else if (inputData.inputType == "option") {
                    return (
                      <div className="mt-4">
                         <label className="mr-4 mb-2">{inputData.title}</label>
                         <select className="bg-item_list_bg p-2" name={inputData.title} value={formData[inputData.title]}
                          onChange={onChange}>           
                          {
                          inputData.options?.map( option => {

                            console.log("OP ", option)
                            console.log("OP test")

                            return (
                              <option value={option}>{option}</option>
                            )
                          })
                        }
                        </select>
                      </div>
                    )
                  } else {
                    return (
                      <div>
                        <label className="block capitalize mb-2" htmlFor={inputData.title}>{inputData.title}<span className="text-red-600"> *</span></label>
                        <input
                          type={inputData.inputType}
                          name={inputData.title}
                          onChange={onChange}
                          value= {formData[inputData.title]}
                          ref={(ref) => {
                            inputRef.current[refCount] = ref
                            increaseRefCount()
                          }}
                          className="bg-item_list_bg w-full h-12 pl-4 mb-4 border-gray-400 border-2 hover:opacity-70 rounded-md "
                      ></input></div>
                    )
                  }
                })()}
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

export default UserForm