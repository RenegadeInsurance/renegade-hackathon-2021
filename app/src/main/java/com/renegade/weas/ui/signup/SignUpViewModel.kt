package com.renegade.weas.ui.signup

import androidx.lifecycle.LiveData
import androidx.lifecycle.MutableLiveData
import androidx.lifecycle.ViewModel
import androidx.lifecycle.viewModelScope
import com.renegade.weas.network.requestbody.SignUpBody
import com.renegade.weas.network.safeapicall.Resource
import com.renegade.weas.repo.MainRepository
import dagger.hilt.android.lifecycle.HiltViewModel
import kotlinx.coroutines.launch
import javax.inject.Inject

@HiltViewModel
class SignUpViewModel
@Inject
constructor(
    private val mainRepository: MainRepository
) : ViewModel() {

    private val _signUpLiveData = MutableLiveData<Resource<SignUpBody>>()
    val signUpLiveData: LiveData<Resource<SignUpBody>> get() = _signUpLiveData

    fun signUp(signUpBody: SignUpBody) {
        _signUpLiveData.value = Resource.Loading
        viewModelScope.launch {
            _signUpLiveData.value = mainRepository.signUp(signUpBody)
        }
    }
}