package com.renegade.weas.network

import com.renegade.weas.network.response.weatherresponse.WeatherResponse
import retrofit2.Call
import retrofit2.Response
import retrofit2.http.Field
import retrofit2.http.GET
val APIKEY =""
interface MyApi {
    @GET("weather")
       suspend fun getApi(
        @Field ("lat" ) lat: Double,
        @Field("lon") lon: Double,
        @Field("cnt") cnt: Int? =null,
        @Field("appid") appid: String= APIKEY,
        @Field("mode") mode: String,
        @Field("units") units: String,
        @Field("lang") lang: String
        ): Response<WeatherResponse>



}