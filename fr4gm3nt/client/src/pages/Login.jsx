import { useState } from "react";
import {useForm} from "react-hook-form"
import { Link } from "react-router-dom";

const Login = () => {


    // hooks and other handlers for login form
    const { register: userLogin, handleSubmit: handleLogin, formState: { errors: loginErrors }, reset: loginReset } = useForm();

    // state to show error message on login
    const [loginUserError, setLoginUserError] = useState(false);
    const [generalLoginError, setGeneralLoginError] = useState(false);

     // on submit
     // do stuff on submit
     const onLoginSubmit = (data) => {
        console.log(data)
        loginReset();
    };
    
    
    return (
        <>
            <form onSubmit={handleLogin(onLoginSubmit)}>
                <div className="w-full bg-gray-200 py-16">
                    <div className="bg-white max-w-screen-xl px-8 grid gap-8 grid-cols-1 md:grid-cols-2 md:px-12 lg:px-16 xl:px-32 py-16 mx-auto text-main-black rounded-lg shadow-lg">
                        <div className="ml-2">
                            <div className="mt-8">
                                {generalLoginError && <p className="text-xs text-red-600 font-heading mt-2">Something went wrong. Please try again.</p>}
                                <span className="font-heading uppercase text-sm text-gray-800 font-bold">Email</span>
                                <input
                                    {...userLogin("email", { required: true, pattern: /^\w+([\.-]?\w+)*@\w+([\.-]?\w+)*(\.\w{2,3})+$/ })}
                                    className="w-full text-gray-900 mt-2 p-3 rounded-lg border-2 border-blue-600 focus:outline-none focus:ring-2 focus:ring-blue-600 focus:border-transparent"
                                    type="email"
                                    placeholder="Enter your email" />
                                {/* handle errors */}
                                {loginErrors.email?.type === 'required' && <p className="text-xs text-red-600 font-heading mt-2">Email is required.</p>}
                                {loginErrors.email?.type === 'pattern' && <p className="text-xs text-red-600 font-heading mt-2">Please enter a valid email address.</p>}

                            </div>
                            <div className="mt-8">
                                <span className="font-heading uppercase text-sm text-gray-800 font-bold">Password</span>
                                <input
                                    onFocus={() => { setLoginUserError(false) }}
                                    {...userLogin("password", { required: true})}
                                    type="password"
                                    className="w-full text-gray-900 mt-2 p-3 rounded-lg border-2 border-blue-600 focus:outline-none focus:ring-2 focus:ring-blue-600 focus:border-transparent"
                                    placeholder="Enter your password" />

                                {/* handle errors */}
                                {loginErrors.password?.type === 'required' && <p className="text-xs text-red-600 font-heading mt-2">Password is required.</p>}
                                {loginUserError && <p className="text-xs text-red-600 font-heading mt-2">Email and password do not match.</p>}
                            </div>
                            <div className="mt-8">
                                <input
                                    onClick={() => console.log(loginErrors)}
                                    type="submit"
                                    className="cursor-pointer uppercase text-sm font-bold tracking-wide bg-blue-600 hover:bg-blue-700 text-gray-100 p-3 rounded-lg w-full focus:outline-none focus:shadow-outline"
                                    value='Login' />

                                <Link className="w-full h-full" to="/register">
                                    <button
                                        className="mt-2 uppercase text-sm font-bold tracking-wide bg-blue-600 hover:bg-blue-700 text-gray-100 p-3 rounded-lg w-full focus:outline-none focus:shadow-outline">
                                        Don't have an account? Register
                                    </button>
                                </Link>
                            </div>
                        </div>
                    </div>
                </div>
            </form>
        </>
    )
}

export default Login
