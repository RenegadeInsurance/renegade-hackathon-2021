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
                    Resource.Success(response.body())
                } else {
                    if (response.code() == 401) {
                        Log.e(TAG, "UnAuthorized Request")
                        Resource.Loading
                    } else {

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