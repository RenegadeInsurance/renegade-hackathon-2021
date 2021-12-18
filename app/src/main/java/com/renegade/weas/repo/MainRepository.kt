package com.renegade.weas.repo

import com.renegade.weas.localdata.DataStoreHelper
import com.renegade.weas.network.apiservices.AuthApi
import com.renegade.weas.network.apiservices.QuestionApi
import com.renegade.weas.network.apiservices.WeatherApi
import com.renegade.weas.network.requestbody.LoginBody
import com.renegade.weas.network.requestbody.SignUpBody
import com.renegade.weas.network.response.loginresponse.LoginResponse
import com.renegade.weas.network.response.questionresponse.QuestionResponse
import com.renegade.weas.network.response.weatherresponse.WeatherResponse
import com.renegade.weas.network.safeapicall.Resource
import com.renegade.weas.network.safeapicall.SafeApiCall
import kotlinx.coroutines.flow.first
import javax.inject.Inject

class MainRepository
@Inject
constructor(
    private val weatherApi: WeatherApi,
    private val authApi: AuthApi,
    private val dataStoreHelper: DataStoreHelper,
    private val questionApi: QuestionApi
) {


    suspend fun getWeather(lat: Double, lon: Double): Resource<WeatherResponse> {
        return SafeApiCall.execute {
            weatherApi.getApi(lat, lon)
        }
    }

    suspend fun signUp(signUpBody: SignUpBody): Resource<SignUpBody> {
        return SafeApiCall.execute { authApi.signUp(signUpBody) }
    }

    suspend fun logIn(loginBody: LoginBody): Resource<LoginResponse> {
        return SafeApiCall.execute { authApi.login(loginBody) }

    }

    suspend fun storeAccessToken(token: String?) {
        token?.let {
            dataStoreHelper.setAccessToken(token)
        }
    }

    suspend fun doesAccessTokenExists(): Boolean = dataStoreHelper.getAccessToken().first() != ""


    suspend fun getFirstQuestion(): Resource<QuestionResponse> {
        return SafeApiCall.execute { questionApi.getFirstQuestion() }
    }

}