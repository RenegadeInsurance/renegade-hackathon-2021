import { createAsyncThunk } from "@reduxjs/toolkit";
import config from "config";
// import { CreateAccountData, LoginData, User, Auth } from "types";
import http from "utils/http";

export const loadCurrentUser = createAsyncThunk(
  "auth/loadCurrentUser",
  async (_, thunkAPI) => {
    try {

      const user = JSON.parse(localStorage.getItem('user'))
      if (user != null) {
        return user
      } 
      const url = config.endpoints.auth.me;
      const { data } = await http.get(url);
      console.log(data)
      localStorage.setItem("user", JSON.stringify(data))
      return data;
    } catch (err) {
      return thunkAPI.rejectWithValue(err.response.data.detail);
    }
  }
);

export const loadCurrentUserProfile = createAsyncThunk(
  "auth/loadCurrentUserProfile",
  async (username, thunkAPI) => {
    try {
      const url = config.endpoints.auth.profile;
      const { data } = await http.get(`${url}/${username}/`);
      return data.profile;
    } catch (err) {
      return thunkAPI.rejectWithValue(err.response.data.detail);
    }
  }
);

export const createAccount = createAsyncThunk(
  "auth/createAccount",
  async ({ first_name, last_name, username, email, password, password2, role } thunkAPI) => {
    try {
      const url = config.endpoints.auth.createAccount;
      const { data } = await http.post(url, { first_name, last_name, username, email, password, password2, role });
      return data;
    } catch (err) {
      // console.log(err.response.data);
      const errors = err.response.data
      const { 0:errs } = Object.keys(errors).map(err => errors[err].map(d=>d))
      return thunkAPI.rejectWithValue(Object.keys(errors)[0]+ " " + errs[0]);
    }
  }
);

export const logIn = createAsyncThunk(
  "auth/logIn",
  async ({ email, password }, thunkAPI) => {
    try {
      const url = config.endpoints.auth.login;
      const {data: { access }} = await http.post(url, { email, password });
      const me = config.endpoints.auth.me;
      const { data } = await http.get(me, {
        headers:{
          "Content-Type": "application/json",
          "Authorization": "Jwt " + access
        }
      });
      localStorage.setItem("user", JSON.stringify(data))
      localStorage.setItem("access_token", access);
      return access;
    } catch (err) {
      return thunkAPI.rejectWithValue(err.response.data.message);
    }
  }
);

export const logOut = createAsyncThunk("auth/logOut", async (_, thunkAPI) => {
  try {
    // const url = config.endpoints.auth.logout;
    localStorage.removeItem("user");
    localStorage.removeItem("access_token");
    // await http.post(url);
  } catch (err) {
    return thunkAPI.rejectWithValue("Error in logout");
  }
});
