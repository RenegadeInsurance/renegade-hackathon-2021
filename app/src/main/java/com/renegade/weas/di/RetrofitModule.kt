package com.renegade.weas.di

import com.renegade.weas.localdata.DataStoreHelper
import com.renegade.weas.network.apiservices.AuthApi
import com.renegade.weas.network.authenticator.AccessAuthenticator
import dagger.Module
import dagger.Provides
import dagger.hilt.InstallIn
import dagger.hilt.components.SingletonComponent
import kotlinx.coroutines.flow.first
import kotlinx.coroutines.runBlocking
import okhttp3.Interceptor
import okhttp3.OkHttpClient
import okhttp3.logging.HttpLoggingInterceptor
import retrofit2.Retrofit
import retrofit2.converter.gson.GsonConverterFactory
import javax.inject.Singleton

private const val TAG = "RetrofitModule"

const val BASE_URL = ""

@Module
@InstallIn(SingletonComponent::class)
object RetrofitModule {
    @Singleton
    @Provides
    fun providesHttpLoggingInterceptor() = HttpLoggingInterceptor().apply {
        level = HttpLoggingInterceptor.Level.BODY
    }


    private fun getHttpClient(
        dataStoreHelper: DataStoreHelper,
        httpLoggingInterceptor: HttpLoggingInterceptor,
        authenticator: AccessAuthenticator? = null,
    ): OkHttpClient {
        val httpBuilder = OkHttpClient.Builder()
        httpBuilder.addInterceptor(httpLoggingInterceptor)
        httpBuilder.addInterceptor(getInterceptorWithTokenHeader(dataStoreHelper))
        authenticator?.let { httpBuilder.authenticator(authenticator) }
        return httpBuilder.build()
    }


    @Singleton
    @Provides
    fun providesRetrofit(
        dataStoreHelper: DataStoreHelper,
        httpLoggingInterceptor: HttpLoggingInterceptor,
        authenticator: AccessAuthenticator
    ): Retrofit =
        Retrofit.Builder()
            .addConverterFactory(GsonConverterFactory.create())
            .baseUrl(BASE_URL)
            .client(getHttpClient(dataStoreHelper, httpLoggingInterceptor, authenticator))
            .build()

    @Singleton
    @Provides
    fun providesAuthApi(retrofit: Retrofit): AuthApi = retrofit.create(AuthApi::class.java)


    private fun getInterceptorWithTokenHeader(dataStoreHelper: DataStoreHelper): Interceptor {
        return Interceptor { chain ->
            runBlocking {
                val original = chain.request()
                val request = original.newBuilder()
                    .header("Authorization", dataStoreHelper.getAccessToken().first())
                    .method(original.method, original.body)
                    .build()
                chain.proceed(request)
            }
        }

    }
}