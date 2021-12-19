package com.renegade.weas.network.response.loginresponse

import com.google.gson.annotations.SerializedName

data class LoginResponse(
    @SerializedName("auth_token")
    val token: String
)