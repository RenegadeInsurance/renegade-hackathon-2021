package com.renegade.weas.ui.login

import androidx.lifecycle.LiveData
import androidx.lifecycle.MutableLiveData
import androidx.lifecycle.ViewModel
import androidx.lifecycle.viewModelScope
import com.renegade.weas.network.requestbody.LoginBody
import com.renegade.weas.network.response.loginresponse.LoginResponse
import com.renegade.weas.network.safeapicall.Resource
import com.renegade.weas.repo.MainRepository
import dagger.hilt.android.lifecycle.HiltViewModel
import kotlinx.coroutines.launch
import javax.inject.Inject


@HiltViewModel
class LoginViewModel
@Inject
constructor(
    private val mainRepository: MainRepository
) : ViewModel() {

    private val _loginLiveData = MutableLiveData<Resource<LoginResponse>>()
    val loginLiveData: LiveData<Resource<LoginResponse>> get() = _loginLiveData

    fun logIn(loginBody: LoginBody) {
        _loginLiveData.value = Resource.Loading
        viewModelScope.launch {
            _loginLiveData.value = mainRepository.logIn(loginBody)
        }
    }

    fun storeAccessToken(token: String?) {
        viewModelScope.launch {
            mainRepository.storeAccessToken(token)
        }
    }
}