package com.coderippers.watchman.network

import com.coderippers.watchman.model.Location
import com.squareup.moshi.Moshi
import com.squareup.moshi.kotlin.reflect.KotlinJsonAdapterFactory
import retrofit2.Retrofit
import retrofit2.converter.moshi.MoshiConverterFactory
import retrofit2.http.Body
import retrofit2.http.POST

const val BASE_URL = "https://MY-BACKEND-XYZ.herokuapp.com/" // "http://192.168.1.155:3000/"
// "http://192.168.1.101:3000/" // "http://10.0.2.2:3000/"

private val moshi: Moshi = Moshi.Builder()
    .add(KotlinJsonAdapterFactory())
    .build()

private val retrofit: Retrofit = Retrofit.Builder()
    .addConverterFactory(MoshiConverterFactory.create(moshi))
    .baseUrl(BASE_URL)
    .build()

interface WatchmanApiService {
    @POST("weather_data")
    suspend fun getWeatherData(@Body detail: List<Location>): String
}

object WatchmanApi {
    val retrofitService: WatchmanApiService by lazy {
        retrofit.create(WatchmanApiService::class.java)
    }
}