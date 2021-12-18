package com.renegade.weas.network.apiservices


import com.renegade.weas.network.requestbody.LoginBody
import com.renegade.weas.network.requestbody.SignUpBody
import com.renegade.weas.network.response.logoutresponse.LoginResponse
import retrofit2.Response
import retrofit2.http.Body
import retrofit2.http.POST

interface AuthApi {
    @POST("api/v1/auth/token/login/")
    suspend fun login(@Body loginBody: LoginBody): Response<LoginResponse>

    @POST("api/v1/auth/users/")
    suspend fun signUp(@Body signUpBody: SignUpBody): Response<SignUpBody>


}