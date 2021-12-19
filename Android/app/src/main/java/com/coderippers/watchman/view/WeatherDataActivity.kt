package com.coderippers.watchman.view

import androidx.appcompat.app.AppCompatActivity
import android.os.Bundle
import android.util.Log
import android.widget.Toast
import androidx.databinding.DataBindingUtil
import androidx.lifecycle.Observer
import androidx.lifecycle.ViewModelProvider
import com.coderippers.watchman.R
import com.coderippers.watchman.adapter.LocationRemoveListener
import com.coderippers.watchman.adapter.OtherLocationAdapter
import com.coderippers.watchman.databinding.ActivityWeatherDataBinding
import com.coderippers.watchman.model.Location
import com.coderippers.watchman.viewmodel.WeatherDataStatus
import com.coderippers.watchman.viewmodel.WeatherDataViewModel
import kotlin.collections.ArrayList

class WeatherDataActivity : AppCompatActivity() {
    private lateinit var binding: ActivityWeatherDataBinding
    private val viewModel: WeatherDataViewModel by lazy {
        ViewModelProvider(this).get(WeatherDataViewModel::class.java)
    }
    private var locationList = ArrayList<Location>()
    private lateinit var otherLocationAdapter: OtherLocationAdapter

    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        binding = DataBindingUtil.setContentView(this, R.layout.activity_weather_data)
        binding.lifecycleOwner = this

        otherLocationAdapter = OtherLocationAdapter(LocationRemoveListener { location ->
            for ((index, l) in locationList.withIndex()) {
                if (l == location) {
                    locationList.remove(l)
                    otherLocationAdapter.notifyDataSetChanged()
                    return@LocationRemoveListener
                }
            }
        })

        binding.addOtherLocations.setOnClickListener {
            // show location data entry popup and get location data from there
            LocationEntryPopup(this, object: LocationDataListener{
                override fun onConfirm(location: Location) {
                    for (l in locationList) {
                        if (l == location) {
                            Toast.makeText(this@WeatherDataActivity, "Location already added", Toast.LENGTH_LONG).show()
                            return
                        }
                    }
                    locationList.add(location)
                }
            })
        }

        binding.otherLocationsRecyclerView.adapter = otherLocationAdapter
        otherLocationAdapter.submitList(locationList)

        binding.fetchWeatherDataButton.setOnClickListener {
            viewModel.getChatList(locationList)
        }

        viewModel.weatherData.observe(this, Observer { data ->
            data?.let {
                binding.weatherDataRecyclerView.text = data
            }
        })

        viewModel.status.observe(this, Observer { status ->
            status?.let {
                when(status) {
                    WeatherDataStatus.DONE -> {
                        viewModel.clearStatus()
                    }
                    WeatherDataStatus.LOADING -> {
                        binding.weatherDataRecyclerView.text = getString(R.string.fetching_data)
                        viewModel.clearStatus()
                    }
                    WeatherDataStatus.NETWORK_ERROR -> {
                        binding.weatherDataRecyclerView.text = "Network error"
                        viewModel.clearStatus()
                    }
                    WeatherDataStatus.SERVER_ERROR -> {
                        binding.weatherDataRecyclerView.text = "Server error"
                        viewModel.clearStatus()
                    }
                }
            }
        })
    }
}