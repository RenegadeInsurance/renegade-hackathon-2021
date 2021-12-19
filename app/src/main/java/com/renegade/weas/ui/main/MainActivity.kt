package com.renegade.weas.ui.main

import android.app.Activity
import android.content.Intent
import android.location.Location
import android.location.LocationListener
import android.location.LocationManager
import android.os.Bundle
import android.util.Log
import android.view.Menu
import android.view.MenuItem
import androidx.activity.result.contract.ActivityResultContracts
import androidx.activity.viewModels
import androidx.appcompat.app.AlertDialog
import androidx.appcompat.app.AppCompatActivity
import com.renegade.weas.R
import com.renegade.weas.databinding.ActivityMainBinding
import com.renegade.weas.network.safeapicall.Resource
import com.renegade.weas.ui.login.LoginActivity
import com.renegade.weas.ui.takesurvey.TakeSurveyActivity
import com.renegade.weas.utils.permission.IOnPermissionAllowed
import com.renegade.weas.utils.permission.SinglePermissionManager
import dagger.hilt.android.AndroidEntryPoint

private const val TAG = "MainActivity"

@AndroidEntryPoint
class MainActivity : AppCompatActivity(), IOnPermissionAllowed {
    private lateinit var binding: ActivityMainBinding
    private val viewModel: MainActivityViewModel by viewModels()
    private lateinit var weatherLayoutHandler: WeatherLayoutHandler

    private var locationManager: LocationManager? = null


    private val takeSurveyStarter =
        registerForActivityResult(ActivityResultContracts.StartActivityForResult()) { result ->
            if (result.resultCode == Activity.RESULT_OK) {
                if (result.data != null) {
                    val risk = result.data!!.getStringExtra("risk")
                    AlertDialog.Builder(this)
                        .setTitle("Your Flood Risk")
                        .setMessage(risk)
                        .setCancelable(false)
                        .setPositiveButton(
                            "Thanks"
                        ) { dialogInterface, _ -> dialogInterface.dismiss() }
                        .create().show()
                }
            }
        }


    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        binding = ActivityMainBinding.inflate(layoutInflater)
        setContentView(binding.root)
        setObserverForIsLoggedIn()
        askForLocationPermission()

        weatherLayoutHandler = WeatherLayoutHandler(binding.weatherLayout)
        viewModel.weatherLiveData.observe(this) { weatherResponse ->
            when (weatherResponse) {
                is Resource.Success -> {
                    weatherResponse.value?.let { weatherLayoutHandler.updateValues(it) }
                }
                is Resource.Failure -> {
                    Log.e(TAG, "onCreateView: Something went wrong")
                }
                is Resource.Loading -> {

                }
            }

        }

        setClickListenerForTakeSurveyBtn()


        viewModel.doesAccessTokenExists()


    }

    private fun askForLocationPermission() {
        SinglePermissionManager(
            this,
            this,
            android.Manifest.permission.ACCESS_COARSE_LOCATION,
            "location",
            "We need your location permission to know your weather forecasting. Would you like to provide permission?"
        ).carryOutAllTheNecessaryThingsForManagingPermission()
    }

    private fun setObserverForIsLoggedIn() {
        viewModel.isLoggedInLiveData.observe(this) { loggedIn ->
            if (!loggedIn) {
                startActivity(Intent(this, LoginActivity::class.java))
                finish()
            }
        }
    }


    private fun setClickListenerForTakeSurveyBtn() {
        binding.homeFrgTakeSurveyBtn.setOnClickListener {
            takeSurveyStarter.launch(Intent(this, TakeSurveyActivity::class.java))
        }
    }

    override fun permissionAllowed() {
        try {
            // Request location updates
            locationManager?.requestLocationUpdates(
                LocationManager.NETWORK_PROVIDER,
                0L,
                0f,
                locationListener
            )
            locationManager = getSystemService(LOCATION_SERVICE) as LocationManager?
            val location: Location? =
                locationManager?.getLastKnownLocation(LocationManager.GPS_PROVIDER)
            if (location != null) {
                val longitude = location.longitude
                val latitude: Double = location.latitude
                viewModel.getWeather(latitude, longitude)
            }
        } catch (ex: SecurityException) {
            Log.e("myTag", "Security Exception, no location available")
        }

    }

    private val locationListener: LocationListener = object : LocationListener {
        override fun onLocationChanged(location: Location) {

        }

        override fun onStatusChanged(provider: String, status: Int, extras: Bundle) {}
        override fun onProviderEnabled(provider: String) {}
        override fun onProviderDisabled(provider: String) {}
    }

    override fun onCreateOptionsMenu(menu: Menu): Boolean {
        menuInflater.inflate(R.menu.mainact_bottom_nav_menu, menu)
        return true
    }

    override fun onOptionsItemSelected(item: MenuItem): Boolean {
        when (item.itemId) {
            (R.id.logoutBtn_menu) -> {
                viewModel.logout()
            }
        }
        return super.onOptionsItemSelected(item)
    }
}