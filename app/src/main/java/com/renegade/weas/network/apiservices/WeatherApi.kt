package com.renegade.weas.network.apiservices

import com.renegade.weas.network.response.weatherresponse.WeatherResponse
import retrofit2.Response
import retrofit2.http.Field
import retrofit2.http.FormUrlEncoded
import retrofit2.http.GET
import retrofit2.http.Query

val APIKEY = "57390f3e72838c9e211d91d6960de1fc"

interface WeatherApi {

    @GET("/data/2.5/weather")
    suspend fun getApi(
        @Query("lat") lat: Int,
        @Query("lon") lon: Int,
        @Query("cnt") cnt: Int? = null,
        @Query("appid") appid: String = APIKEY,
        @Query("mode") mode: String? = null,
        @Query("units") units: String? = null,
        @Query("lang") lang: String? = null
    ): Response<WeatherResponse>


}