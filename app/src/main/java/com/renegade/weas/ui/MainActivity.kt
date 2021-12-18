package com.renegade.weas.ui

import android.content.Intent
import android.os.Bundle
import androidx.activity.viewModels
import androidx.appcompat.app.AppCompatActivity
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
    }
}