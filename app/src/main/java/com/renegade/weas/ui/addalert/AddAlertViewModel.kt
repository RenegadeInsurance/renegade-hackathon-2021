package com.renegade.weas.ui.addalert

import androidx.lifecycle.LiveData
import androidx.lifecycle.MutableLiveData
import androidx.lifecycle.ViewModel
import androidx.lifecycle.viewModelScope
import com.renegade.weas.network.requestbody.AlertBody
import com.renegade.weas.network.safeapicall.Resource
import com.renegade.weas.repo.MainRepository
import dagger.hilt.android.lifecycle.HiltViewModel
import kotlinx.coroutines.launch
import javax.inject.Inject

@HiltViewModel
class AddAlertViewModel
@Inject
constructor(
    private val mainRepository: MainRepository
) : ViewModel() {

    private val _alertListLiveData = MutableLiveData<Resource<List<AlertBody>>>()
    val alertListLiveData: LiveData<Resource<List<AlertBody>>> get() = _alertListLiveData

    fun getAlertPersonnel() {
        _alertListLiveData.value = Resource.Loading
        viewModelScope.launch {
            _alertListLiveData.value = mainRepository.getAlertPersonnel()
        }
    }

    fun addAlertPersonnel(alertBody: AlertBody) {
        viewModelScope.launch {
            mainRepository.addAlertPersonnel(alertBody)
            getAlertPersonnel()
        }
    }
}