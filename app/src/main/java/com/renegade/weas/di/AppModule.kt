package com.renegade.weas.di

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
    private fun provideRetrofit() =
        Retrofit.Builder().addConverterFactory(GsonConverterFactory.create()). baseUrl (API).build()


}