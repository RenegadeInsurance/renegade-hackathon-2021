package com.renegade.weas.network.apiservices

import com.renegade.weas.network.response.weatherresponse.WeatherResponse
import retrofit2.Response
import retrofit2.http.Field
import retrofit2.http.GET
val APIKEY ="57390f3e72838c9e211d91d6960de1fc"
interface WeatherApi {
    @GET("weather")
       suspend fun getApi(
        @Field ("lat" ) lat: Double,
        @Field("lon") lon: Double,
        @Field("cnt") cnt: Int? =null,
        @Field("appid") appid: String= APIKEY,
        @Field("mode") mode: String?=null,
        @Field("units") units: String?=null,
        @Field("lang") lang: String?=null
        ): Response<WeatherResponse>



}