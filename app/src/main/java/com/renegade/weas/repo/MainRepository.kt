package com.renegade.weas.repo

import com.renegade.weas.network.apiservices.WeatherApi
import com.renegade.weas.network.response.weatherresponse.WeatherResponse
import com.renegade.weas.network.safeapicall.Resource
import com.renegade.weas.network.safeapicall.SafeApiCall
import okio.`-DeprecatedOkio`
import javax.inject.Inject

class MainRepository
@Inject
constructor(
private val weatherApi: WeatherApi
) {



    suspend fun getWeather(lat: Double, lon: Double): Resource<WeatherResponse> {
    return    SafeApiCall.execute {
            weatherApi.getApi(lat, lon)
        }
    }
}