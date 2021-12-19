import { createSlice } from '@reduxjs/toolkit';
import { AuthState, User } from 'types';
import { createAccount, loadCurrentUser, logIn, logOut } from './auth.actions';
import authHeader from 'services/auth-header' 

export const initialState = Object.freeze({
  access: '',
  error: '',
  status: 'idle',
  isAuthenticated: false,
  user: {},
});

const authSlice = createSlice({
  name: 'auth',
  initialState,
  reducers: {
    clearAuthError: (state) => {
      state.error = '';
    },
  },

  extraReducers: (builder) => {
    builder.addCase(loadCurrentUser.pending, (state) => {
      state.status = 'pending';
    });

    // handles auth/loadCurrentUser
    builder.addCase(loadCurrentUser.fulfilled, (state, { payload }) => {
      state.user = payload;
      const { username } = JSON.parse(localStorage.getItem('user'))
      if (username) {
        state.isAuthenticated = true;
        state.status = 'logged';
      } else
        state.status = 'resolved';
    });

    builder.addCase(loadCurrentUser.rejected, (state) => {
      state.user = {};
      state.isAuthenticated = false;
      state.status = 'rejected';
    });

    builder.addCase(createAccount.pending, (state) => {
      state.status = 'pending';
    });

    builder.addCase(createAccount.fulfilled, (state, { payload }) => {
      state.isAuthenticated = true;
      state.status = 'resolved';
      state.user = payload;
    });

    builder.addCase(createAccount.rejected, (state, { payload }) => {
      state.error = payload;
      state.isAuthenticated = false;
      state.status = 'rejected';
    });

    builder.addCase(logIn.pending, (state) => {
      state.status = 'pending';
    });

    builder.addCase(logIn.fulfilled, (state, { payload }) => {
      state.isAuthenticated = true;
      state.status = 'logged';
      state.access = payload;
      const user = JSON.parse(localStorage.getItem("user"));
      state.user = user;
    });

    builder.addCase(logIn.rejected, (state, { payload }) => {
      state.error = payload;
      state.isAuthenticated = false;
      state.status = 'rejected';
    });

    builder.addCase(logOut.pending, (state) => {
      state.status = 'pending';
    });

    builder.addCase(logOut.fulfilled, (state) => {
      state.isAuthenticated = false;
      state.status = 'resolved';
      state.user = {};
    });

    builder.addCase(logOut.rejected, (state) => {
      state.isAuthenticated = false;
      state.status = 'rejected';
      state.user = {};
    });
  },
});

// actions from slice
export const { clearAuthError } = authSlice.actions;

// The reducer
export default authSlice.reducer;
