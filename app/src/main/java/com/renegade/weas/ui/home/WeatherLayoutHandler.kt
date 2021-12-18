package com.renegade.weas.ui.home

import com.renegade.weas.databinding.WeatherLayoutBinding
import com.renegade.weas.network.response.weatherresponse.WeatherResponse
import com.renegade.weas.network.safeapicall.Resource
import java.util.*

class WeatherLayoutHandler(
    private val binding: WeatherLayoutBinding,
) {
    private lateinit var weatherResponse: WeatherResponse

    fun updateValues() {
        var date = Calendar.getInstance().time
        binding.currentDateTxt.setText(date.toString())
        binding.currentTempTxt.setText(weatherResponse.main.temp.toString())
        binding.weatherTxt.setText(weatherResponse.weather[0].main)
        binding.minTempTxt.setText(weatherResponse.main.temp_min.toString() +"F")
        binding.maxTempTxt.setText(weatherResponse.main.temp_max.toString()+"F")
        binding.humidity.setText(weatherResponse.main.humidity.toString())
        binding.pressure.setText(weatherResponse.main.pressure.toString())

    }
}