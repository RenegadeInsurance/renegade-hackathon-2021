package com.renegade.weas.network.requestbody

import androidx.annotation.StringRes
import com.google.gson.annotations.SerializedName

data class SignUpBody(
    @SerializedName("email")
    val email: String,

    @SerializedName("password")
    val password: String,

    @SerializedName("first_name")
    val fName: String,

    @SerializedName("last_name")
    val lName: String,

    @SerializedName("province")
    val province: String,

    @SerializedName("city")
    val city: String,

    @SerializedName("phone")
    val phoneNo: String
)

