package com.renegade.weas.network.apiservices

import com.renegade.weas.network.requestbody.AlertBody
import com.renegade.weas.network.requestbody.QuestionBody
import com.renegade.weas.network.response.questionresponse.QuestionResponse
import retrofit2.Response
import retrofit2.http.Body
import retrofit2.http.GET
import retrofit2.http.POST

interface MainApi {
    @POST("api/v1/question/")
    suspend fun getFirstQuestion(): Response<QuestionResponse>

    @POST("api/v1/question/")
    suspend fun getNextQuestion(@Body questionBody: QuestionBody): Response<QuestionResponse>

    @POST("api/v1/auth/token/logout/")
    suspend fun logOut(): Response<Unit>

    @GET("api/v1/alert/")
    suspend fun getAlertPersonnel(): Response<List<AlertBody>>
}