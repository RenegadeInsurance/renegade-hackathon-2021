import { useState } from "react"
import { useForm } from "react-hook-form";
import { Link } from "react-router-dom";

import DatePicker from "react-datepicker";
import "react-datepicker/dist/react-datepicker.css";

import fmapi from "../api/fmapi"
import ageCalc from "../helpers/ageCalc";



const Register = () => {

    // age
    const [age, setAge] = useState(0);
    const [startDate, setStartDate] = useState(new Date());


    // conditionals to show error message on register
    const [registerUserError, setRegisterUserError] = useState(false);
    const [generalRegisterError, setGeneralRegisterError] = useState(false);

    // REACT HOOK FORM
    const { register: userRegister, handleSubmit: handleRegister, formState: { errors: registerErrors }, reset: registerReset } = useForm();

    const handleDateChange = (dob) => {
        setStartDate(dob);
        
        const age = ageCalc(dob)
        // console.log(dob);
        // console.log(age);
        setAge(age);
    }

    const formatDate = (date) => {
        var d = new Date(date),
            month = '' + (d.getMonth() + 1),
            day = '' + d.getDate(),
            year = d.getFullYear();
    
        if (month.length < 2)
            month = '0' + month;
        if (day.length < 2)
            day = '0' + day;
    
        return [year, month, day].join('-');
    }


    const registerUser = async (data) => {

        try{
            console.log(data);
            const response =  await fmapi.post('/app-users/register', data)
            
        }catch(error){
            console.log(error);
        }

    }


    const onRegisterSubmit = data => {
        data.dob = formatDate(startDate);

        registerUser(data);
        // console.log(data);
        // registerReset();
    }



    return (
        <>
            <form onSubmit={handleRegister(onRegisterSubmit)}>
                <div className="w-full bg-gray-200 py-16">
                    <div className="bg-white max-w-screen-xl px-8 grid gap-8 grid-cols-1 md:grid-cols-2 md:px-12 lg:px-16 xl:px-32 py-16 mx-auto text-main-black rounded-lg shadow-lg">

                        {/* first column */}
                        <div className="ml-2">

                            <hr className="mt-6 border-2 rounded-full border-blue-400" />

                            <h1 className="font-heading mt-4 mb-2 font-semibold text-xl text-gray-800">General Details</h1>

                            <hr className="mb-6 border-2 rounded-full border-blue-400" />



                            <div>
                                {generalRegisterError && <p className="text-xs text-red-600 font-heading mt-2">Something went wrong. Please try again.</p>}
                                <span className="font-heading uppercase text-sm text-gray-800 font-bold">Full Name</span>
                                <input
                                    {...userRegister("fullName", { required: true })}
                                    className="w-full text-gray-900 mt-2 p-3 rounded-lg border-2 border-blue-600 focus:outline-none focus:ring-2 focus:ring-blue-600 focus:border-transparent"
                                    type="text" placeholder="Enter your name" />

                                {/* handle errors */}
                                {registerErrors.fullName?.type === 'required' && <p className="text-xs text-red-600 font-heading mt-2">Name is required.</p>}
                            </div>

                            <div className="flex items-center mt-2">
                                <div className="flex flex-col">
                                    <span className="font-heading uppercase text-sm text-gray-800 font-bold">DOB</span>
                                    {/* <input
                                        {...userRegister("age", { required: true })}
                                        className="w-1/2 text-gray-900 mt-2 p-3 rounded-lg border-2 border-blue-600 focus:outline-none focus:ring-2 focus:ring-blue-600 focus:border-transparent"
                                        type="number" placeholder="age" value={age} disabled="true" /> */}
                                    <DatePicker
                                        className="w-2/3 text-gray-900 mt-2 p-3 rounded-lg border-2 border-blue-600 focus:outline-none focus:ring-2 focus:ring-blue-600 focus:border-transparent"
                                        dateFormat="yyyy/MM/dd"
                                        required={true}
                                        closeOnScroll={(e) => e.target === document}
                                        selected={startDate}
                                        onChange={(date) => {
                                            handleDateChange(date);
                                        }}
                                    />

                                    {/* handle errors */}
                                    {registerErrors.dob?.type === 'required' && <p className="text-xs text-red-600 font-heading mt-2">Dob is required.</p>}
                                </div>

                                <div className="flex flex-col">
                                    <span className="font-heading uppercase text-sm text-gray-800 font-bold">Age</span>
                                    <input

                                        className="w-1/2 text-gray-900 mt-2 p-3 rounded-lg border-2 border-blue-600 focus:outline-none focus:ring-2 focus:ring-blue-600 focus:border-transparent"
                                        type="number" placeholder="age" value={age} disabled={true} />

                                </div>



                            </div>
                            <div className="flex flex-col mt-5">
                                <span className="font-heading uppercase text-sm text-gray-800 font-bold">Gender</span>
                                <select
                                    {...userRegister("gender", { required: true })}
                                    className="text-gray-900 mt-2 p-3 rounded-lg border-2 bg-white border-blue-600 focus:outline-none focus:ring-2 focus:ring-blue-600 focus:border-transparent">
                                    <option value="male">male</option>
                                    <option value="female">female</option>
                                    <option value="other">other</option>
                                </select>
                                {registerErrors.gender?.type === 'required' && <p className="text-xs text-red-600 font-heading mt-2">Gender is required.</p>}
                            </div>

                            <div className="mt-3">
                                <span className="font-heading uppercase text-sm text-gray-800 font-bold">Email</span>
                                <input
                                    onFocus={() => { setRegisterUserError(false) }}
                                    {...userRegister("email", { required: true, pattern: /^\w+([\.-]?\w+)*@\w+([\.-]?\w+)*(\.\w{2,3})+$/ })}
                                    className="w-full text-gray-900 mt-2 p-3 rounded-lg border-2 border-blue-600 focus:outline-none focus:ring-2 focus:ring-blue-600 focus:border-transparent"
                                    type="email" placeholder="Enter your email" />
                                {/* handle errors */}
                                {registerErrors.email?.type === 'required' && <p className="text-xs text-red-600 font-heading mt-2">Email is required.</p>}
                                {registerErrors.email?.type === 'pattern' && <p className="text-xs text-red-600 font-heading mt-2">Please enter a valid email address.</p>}
                                {registerUserError && <p className="text-xs text-red-600 font-heading mt-2">Email address is already registered.</p>}

                            </div>
                            <div className="mt-8">
                                <span className="font-heading uppercase text-sm text-gray-800 font-bold">Password</span>
                                <input
                                    {...userRegister("password", { required: true, minLength: 6 })}
                                    type="password"
                                    className="w-full text-gray-900 mt-2 p-3 rounded-lg border-2 border-blue-600 focus:outline-none focus:ring-2 focus:ring-blue-600 focus:border-transparent"
                                    placeholder="Enter your password"

                                />
                                {/* handle errors */}
                                {registerErrors.password?.type === 'required' && <p className="text-xs text-red-600 font-heading mt-2">Password is required.</p>}
                                {registerErrors.password?.type === 'minLength' && <p className="text-xs text-red-600 font-heading mt-2">Password must 6 characters or more.</p>}
                            </div>

                        </div>


                        {/* second col */}
                        <div className="ml-2">

                            <hr className="mt-6 border-2 rounded-full border-blue-400" />

                            <h1 className="font-heading mt-4 mb-2 font-semibold text-xl text-gray-800">Location Details</h1>

                            <hr className="mb-6 border-2 rounded-full border-blue-400" />


                            <div className="mt-2">
                                <div className="flex flex-col justify-center">
                                    <div className="flex flex-col my-2">
                                        <span className="font-heading uppercase text-sm text-gray-800 font-bold">Country</span>
                                        <input
                                            {...userRegister("country", { required: true })}
                                            className="w-full text-gray-900 mt-1 p-3 rounded-lg border-2 border-blue-600 focus:outline-none focus:ring-2 focus:ring-blue-600 focus:border-transparent"
                                            type="text" placeholder="country" />

                                        {/* handle errors */}
                                        {registerErrors.country?.type === 'required' && <p className="text-xs text-red-600 font-heading mt-2">Country is required.</p>}
                                    </div>

                                    <div className="flex flex-col my-2">
                                        <span className="font-heading uppercase text-sm text-gray-800 font-bold">State</span>
                                        <select
                                            {...userRegister("gender", { required: true })}
                                            placeholder="state"
                                            className="text-gray-900 mt-2 p-3 rounded-lg border-2 bg-white border-blue-600 focus:outline-none focus:ring-2 focus:ring-blue-600 focus:border-transparent">
                                            <option value="1">State-1</option>
                                            <option value="2">State-2</option>
                                            <option value="3">State-3</option>
                                            <option value="4">State-4</option>
                                            <option value="5">State-5</option>
                                            <option value="7">State-6</option>
                                            <option value="7">State-7</option>
                                        </select>

                                        {/* handle errors */}
                                        {registerErrors.state?.type === 'required' && <p className="text-xs text-red-600 font-heading mt-2">State is required.</p>}
                                    </div>

                                    <div className="flex flex-col my-2">
                                        <span className="font-heading uppercase text-sm text-gray-800 font-bold">City</span>
                                        <input
                                            {...userRegister("city", { required: true })}
                                            className="w-full text-gray-900 mt-1 p-3 rounded-lg border-2 border-blue-600 focus:outline-none focus:ring-2 focus:ring-blue-600 focus:border-transparent"
                                            type="text" placeholder="city" />

                                        {/* handle errors */}
                                        {registerErrors.city?.type === 'required' && <p className="text-xs text-red-600 font-heading mt-2">City is required.</p>}
                                    </div>
                                </div>
                            </div>
                        </div>

                        <div className="mt-8">
                            <input
                                // onClick={() => console.log(registerErrors)}
                                type="submit"
                                className="cursor-pointer uppercase text-sm font-bold tracking-wide bg-blue-600 text-gray-100 p-3 rounded-lg w-full focus:outline-none focus:shadow-outline"
                                value='Register'
                            />

                            <Link to="/login">
                                <button
                                    className="mt-2 uppercase text-sm font-bold tracking-wide bg-blue-600 text-gray-100 p-3 rounded-lg w-full focus:outline-none focus:shadow-outline">
                                    Already have an account? Login
                                </button>
                            </Link>
                        </div>
                    </div>
                </div>
            </form>
        </>
    )
}

export default Register
