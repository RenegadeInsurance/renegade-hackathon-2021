package com.coderippers.watchman.viewmodel

import android.util.Log
import androidx.lifecycle.LiveData
import androidx.lifecycle.MutableLiveData
import androidx.lifecycle.ViewModel
import androidx.lifecycle.viewModelScope
import com.coderippers.watchman.model.Location
import com.coderippers.watchman.network.WatchmanApi
import kotlinx.coroutines.launch
import java.net.ConnectException

enum class WeatherDataStatus { LOADING, SERVER_ERROR, NETWORK_ERROR, DONE }

class WeatherDataViewModel: ViewModel() {
    private val _status = MutableLiveData<WeatherDataStatus>()
    val status: LiveData<WeatherDataStatus>
        get() = _status

    private val _weatherData = MutableLiveData<String>()
    val weatherData: LiveData<String>
        get() = _weatherData

    fun clearStatus() {
        _status.value = null
    }

    fun getChatList(locationList: List<Location>) {
        viewModelScope.launch {
            try {
                Log.i("ChatViewModel", "Begin...")
                _status.value = WeatherDataStatus.LOADING

                val returnedValue = WatchmanApi.retrofitService.getWeatherData(locationList)
                Log.i("ChatViewModel", returnedValue.toString())

                _status.value = WeatherDataStatus.DONE

                if (returnedValue.isNotEmpty()) {
                    _weatherData.value = returnedValue
                } else {
                    _weatherData.value = "No data found"
                }
            } catch (t: ConnectException) {
                Log.i("WeatherDataViewModel", "Connection_Error ::: $t")
                _status.value = WeatherDataStatus.NETWORK_ERROR
            } catch (t: Throwable) {
                Log.i("WeatherDataViewModel", "Failed ::: $t")
                _status.value = WeatherDataStatus.SERVER_ERROR
            }
        }
    }
}