package com.renegade.weas.network.requestbody

import com.google.gson.annotations.SerializedName

data class AlertBody(
    @SerializedName("name")
    val name: String,
    @SerializedName("relationship")
    val relationShip: String,
    @SerializedName("email")
    val email: String,
    @SerializedName("phone")
    val phone: String,
    val id: Int = 0
)