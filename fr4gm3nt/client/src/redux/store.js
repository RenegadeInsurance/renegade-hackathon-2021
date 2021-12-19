import { configureStore } from '@reduxjs/toolkit'

import userReducer from "./slice/userSlice"
import formReducer from './slice/formSlice'

export default configureStore({
    reducer:{
        userStore: userReducer,
        formStore: formReducer
    }
})