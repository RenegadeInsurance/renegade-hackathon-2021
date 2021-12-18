package com.renegade.weas.ui

import androidx.lifecycle.LiveData
import androidx.lifecycle.MutableLiveData
import androidx.lifecycle.ViewModel
import androidx.lifecycle.viewModelScope
import com.renegade.weas.network.response.weatherresponse.WeatherResponse
import com.renegade.weas.network.safeapicall.Resource
import com.renegade.weas.repo.MainRepository
import dagger.hilt.android.lifecycle.HiltViewModel
import kotlinx.coroutines.launch
import javax.inject.Inject


@HiltViewModel
class MainActivityViewModel
@Inject
constructor(
    private val mainRepository: MainRepository
) : ViewModel() {

    private val _weatherLiveData = MutableLiveData<Resource<WeatherResponse>>()
    val weatherLiveData: LiveData<Resource<WeatherResponse>> get() = _weatherLiveData
    fun getWeather(lat: Double, lon: Double) {
        viewModelScope.launch {
            _weatherLiveData.value= mainRepository.getWeather(lat, lon)
        }
    }


}