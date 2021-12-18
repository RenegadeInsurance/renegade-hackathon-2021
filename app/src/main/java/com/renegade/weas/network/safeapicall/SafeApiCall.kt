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
                Log.e(TAG, "execute: klasjfdlkasdjf")
                val response = apiCall.invoke()
                Log.e(TAG, "execute no response", )
                if (response.isSuccessful) {
                    Log.e(TAG, "execute: success")
                    Resource.Success(response.body())
                } else {
                    if (response.code() == 401) {
                        Log.e(TAG, "execute: authorization")
                        Log.e(TAG, "UnAuthorized Request")
                        Resource.Loading
                    } else {
                        Log.e(TAG, "execute: sign up fail")

                        Resource.Failure(response.errorBody().toString(), false)
                    }
                }
            } catch (e: Exception) {
                Log.e(TAG, "Unknown Api Error: ${e.message}")
                Resource.Failure("Something went wrong", true)
            }
        }
    }
}