import { Link } from "react-router-dom"

const Nav = () => {
    return (
        <>
            <nav className="bg-white border-b-2 border-blue-600">
                <div className="max-w-7xl mx-auto px-4">
                    <div className="flex justify-between items-center">
                        <div className="flex space-x-7">
                            <div className="capitalize text-black font-bold">
                               weather alert system
                            </div>

                        </div>
                        {/* <!-- Navbar items --> */}
                        <div className="hidden md:flex items-center space-x-3 ">
                            <Link to="/" className="py-4 px-2 text-black font-semibold hover:text-blue-800 transition duration-300">Home</Link>
                            <Link to="/login" className="py-4 px-2 text-black font-semibold hover:text-blue-800 transition duration-300">Login</Link>
                            <Link to="/register" className="py-4 px-2 text-black font-semibold hover:text-blue-800 transition duration-300">Register</Link>
                        </div>
                    </div>
                </div>
            </nav>
        </>
    )
}

export default Nav
