package com.renegade.weas.ui.main

import android.app.Activity
import android.content.Intent
import android.os.Bundle
import android.util.Log
import androidx.activity.result.contract.ActivityResultContracts
import androidx.activity.viewModels
import androidx.appcompat.app.AlertDialog
import androidx.appcompat.app.AppCompatActivity
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
                        ) { dialogInterface, _ ->  dialogInterface.dismiss()}
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
        viewModel.getWeather(10.0, 10.0)

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

    }
}