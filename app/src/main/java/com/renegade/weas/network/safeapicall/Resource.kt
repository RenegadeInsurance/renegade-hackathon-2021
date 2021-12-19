package com.renegade.weas.network.safeapicall


sealed class Resource<out T>{
    class Success<T>(val value: T?): Resource<T>()
    class Failure(val errorMsg: String, val isUnknownError: Boolean): Resource<Nothing>()
    object Loading: Resource<Nothing>()
}