package com.renegade.weas.network.response.questionresponse

data class QuestionResponse(
    val answers: List<Answer>,
    val id: Int,
    val question: String
)