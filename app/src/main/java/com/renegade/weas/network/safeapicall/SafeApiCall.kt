package com.renegade.weas.network.safeapicall


import android.util.Log
import kotlinx.coroutines.Dispatchers
import kotlinx.coroutines.withContext
import retrofit2.Response


private const val TAG = "SafeApiCall"

object SafeApiCall {
    suspend fun <T> execute(
        apiCall: suspend () -> Response<T>
    ): Resource<T> {
        return withContext(Dispatchers.IO) {
            try {
                val response = apiCall.invoke()
                if (response.isSuccessful) {
                    Log.d(TAG, "execute: success")
                    Resource.Success(response.body())
                } else {
                    if (response.code() == 401) {
                        Log.d(TAG, "UnAuthorized Request")
                        Resource.Loading
                    } else {
                        Log.d(TAG, "execute: sign up fail")
                        Resource.Failure("Something went wrong", false)
                    }
                }
            } catch (e: Exception) {
                Log.d(TAG, "Unknown Api Error: ${e.message}")
                Resource.Failure("Something went wrong", true)
            }
        }
    }
}