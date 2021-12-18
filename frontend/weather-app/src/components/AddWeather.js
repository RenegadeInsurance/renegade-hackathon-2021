import {GrAddCircle} from 'react-icons/gr'
import {IoMdAddCircle} from 'react-icons/io'


const AddWeather = ()=> {
    return (
        <div className="w-96 h-96 bg-color5 rounded-2xl text-white flex items-center hover:opacity-90">
            {/* <GrAddCircle className ="text-8xl text-white" color="white"/> */}
            <IoMdAddCircle className="text-8xl m-auto"/>
        </div>
        )
}

export default AddWeather