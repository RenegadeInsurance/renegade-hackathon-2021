import { createSlice } from "@reduxjs/toolkit";

// initial state of categories
const initialState = {
    loggedin: false,
}

const userSlice = createSlice({
    name:"user",
    initialState,
    reducers: {
        // user actions
        setLoggedInTrue: (state) => {
            state.loggedin = true;
            state.loggingin=false;
        },
        setLoggedInFalse: (state) => {
            state.loggedin = false;
        }
    }
});

export const { setLoggedInTrue, setLoggedInFalse } = userSlice.actions;

// export reducer to use in store
export default userSlice.reducer;