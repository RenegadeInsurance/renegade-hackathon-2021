package com.renegade.weas.network.requestbody

import com.google.gson.annotations.SerializedName

data class QuestionBody(
    @SerializedName("current_ques")
    val currentQuestionID: Long,

    @SerializedName("answer")
    val ansID: Long
)