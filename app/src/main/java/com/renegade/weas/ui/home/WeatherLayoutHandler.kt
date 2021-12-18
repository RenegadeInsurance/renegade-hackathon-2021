package com.renegade.weas.ui.home

import androidx.annotation.DrawableRes
import com.renegade.weas.R
import com.renegade.weas.databinding.WeatherInfoLayoutBinding
import com.renegade.weas.databinding.WeatherLayoutBinding
import com.renegade.weas.network.response.weatherresponse.WeatherResponse
import java.text.SimpleDateFormat
import java.util.*

class WeatherLayoutHandler(
    private val binding: WeatherLayoutBinding,
) {

    init {
        setUpTitle()
        setUpImage()
        setUpDate()
    }

    private fun setUpDate() {
        binding.currentDateTxt.text = SimpleDateFormat("dd MMM, yyyy", Locale.US).format(Date())
    }

    private fun setUpImage() {
        setImageInCard(binding.minTempCard, R.drawable.low_temperature)
        setImageInCard(binding.maxTempCard, R.drawable.high_temperature)
        setImageInCard(binding.humidityCard, R.drawable.humidity)
        setImageInCard(binding.pressureCard, R.drawable.pressure)
    }

    private fun setImageInCard(card: WeatherInfoLayoutBinding, @DrawableRes drawableID: Int) {
        card.weatherInfoIv.setImageResource(drawableID)
    }

    private fun setUpTitle() {
        setTitleInCard(binding.humidityCard, "Humidity")
        setTitleInCard(binding.pressureCard, "Pressure")
        setTitleInCard(binding.maxTempCard, "Max Temp.")
        setTitleInCard(binding.minTempCard, "Min Temp.")
    }

    private fun setTitleInCard(card: WeatherInfoLayoutBinding, title: String) {
        card.weatherInfoTitleTV.text = title
    }

    fun updateValues(weatherResponse: WeatherResponse) {
        binding.currentTempTxt.text = ("${weatherResponse.main.temp}  F")
        setValueInCard(binding.humidityCard, weatherResponse.main.humidity.toString())
        setValueInCard(binding.pressureCard, weatherResponse.main.pressure.toString())
        setValueInCard(binding.minTempCard, ("${weatherResponse.main.temp_min} F"))
        setValueInCard(binding.maxTempCard, ("${weatherResponse.main.temp_max} F"))
        binding.weatherTxt.text = weatherResponse.weather[0].main
    }

    private fun setValueInCard(card: WeatherInfoLayoutBinding, value: String) {
        card.weatherInfoValueTV.text = value
    }
}