package com.renegade.weas.di

import com.renegade.weas.network.apiservices.WeatherApi
import dagger.Module
import dagger.Provides
import dagger.hilt.InstallIn
import dagger.hilt.components.SingletonComponent
import retrofit2.Retrofit
import retrofit2.converter.gson.GsonConverterFactory
import javax.inject.Singleton

val API = "api.openweathermap.org/data/2.5/"

@Module
@InstallIn(SingletonComponent::class)
object AppModule {

    @Provides
    @Singleton
    fun provideRetrofit(): Retrofit =
        Retrofit.Builder().addConverterFactory(GsonConverterFactory.create()).baseUrl(API).build()

    @Provides
    @Singleton
    fun provideWeatherApi(retrofit: Retrofit):WeatherApi = retrofit.create(WeatherApi::class.java)
}