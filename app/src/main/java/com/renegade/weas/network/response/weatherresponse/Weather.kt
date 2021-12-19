package com.renegade.weas.network.response.weatherresponse

data class Weather(
    val description: String,
    val icon: String,
    val id: Int,
    val main: String
)