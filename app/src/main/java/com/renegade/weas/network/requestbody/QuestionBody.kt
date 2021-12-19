package com.renegade.weas.network.requestbody

import com.google.gson.annotations.SerializedName

data class QuestionBody(
    @SerializedName("current_ques")
    val currentQuestionID: Int,

    @SerializedName("answer")
    val ansID: Int
)