package com.renegade.weas.ui.home

import com.renegade.weas.databinding.WeatherLayoutBinding
import com.renegade.weas.network.response.weatherresponse.WeatherResponse
import com.renegade.weas.network.safeapicall.Resource
import java.util.*

class WeatherLayoutHandler(
    private val binding: WeatherLayoutBinding,
) {
    fun updateValues(weatherResponse: WeatherResponse) {
        val date = Calendar.getInstance().time
        binding.currentDateTxt.text = date.toString()
        binding.currentTempTxt.text = weatherResponse.main.temp.toString()
        binding.weatherTxt.text = weatherResponse.weather[0].main
        binding.minTempTxt.text = ("${weatherResponse.main.temp_min} F")
        binding.maxTempTxt.text = ("${weatherResponse.main.temp_max} F")
        binding.humidity.text = weatherResponse.main.humidity.toString()
        binding.pressure.text = weatherResponse.main.pressure.toString()
    }
}