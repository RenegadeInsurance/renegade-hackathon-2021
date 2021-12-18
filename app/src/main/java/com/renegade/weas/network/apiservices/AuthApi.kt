package com.renegade.weas.network.apiservices


import com.renegade.weas.network.apiendpoints.ApiEndPoints
import com.renegade.weas.network.requestbody.LoginBody
import com.renegade.weas.network.response.logoutresponse.LoginResponse
import retrofit2.Response
import retrofit2.http.Body
import retrofit2.http.POST

interface AuthApi {
    @POST(ApiEndPoints.login)
    suspend fun login(@Body loginBody: LoginBody): Response<LoginResponse>


}