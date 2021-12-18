package com.renegade.weas.ui


import android.content.Intent
import android.location.Location
import android.location.LocationListener
import android.location.LocationManager
import android.os.Bundle
import android.util.Log
import androidx.activity.viewModels
import androidx.appcompat.app.AppCompatActivity
import androidx.core.app.ActivityCompat
import androidx.navigation.fragment.findNavController
import androidx.navigation.ui.setupWithNavController
import com.renegade.weas.R
import com.renegade.weas.databinding.ActivityMainBinding
import com.renegade.weas.ui.login.LoginActivity
import com.renegade.weas.utils.permission.IOnPermissionAllowed
import com.renegade.weas.utils.permission.SinglePermissionManager
import dagger.hilt.android.AndroidEntryPoint

@AndroidEntryPoint
class MainActivity : AppCompatActivity(), IOnPermissionAllowed {
    private lateinit var binding: ActivityMainBinding
    private var locationManager: LocationManager? = null

    private val viewModel: MainActivityViewModel by viewModels()
    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        binding = ActivityMainBinding.inflate(layoutInflater)
        setContentView(binding.root)
        setObserverForIsLoggedIn()
        askForLocationPermission()

        viewModel.doesAccessTokenExists()

        setUpNavControllerWithBottomNav()


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


    private fun setUpNavControllerWithBottomNav() {
        supportFragmentManager.findFragmentById(R.id.mainAct_container)?.let {
            binding.mainActBottomNavView.setupWithNavController(it.findNavController())
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
        } catch (ex: SecurityException) {
            locationManager = getSystemService(LOCATION_SERVICE) as LocationManager?
            val location: Location? =
                locationManager?.getLastKnownLocation(LocationManager.GPS_PROVIDER)
            val longitude: Double = location?.longitude as Double
            val latitude: Double = location.latitude as Double
            viewModel.getWeather(latitude, longitude)
        } catch (ex: SecurityException) {
            Log.d("myTag", "Security Exception, no location available")
        }

    }

    private val locationListener: LocationListener = object : LocationListener {
        override fun onLocationChanged(location: Location) {

        }

        override fun onStatusChanged(provider: String, status: Int, extras: Bundle) {}
        override fun onProviderEnabled(provider: String) {}
        override fun onProviderDisabled(provider: String) {}
    }


}
