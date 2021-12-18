package com.renegade.weas.ui

import android.os.Bundle
import androidx.activity.viewModels
import androidx.appcompat.app.AppCompatActivity
import androidx.navigation.fragment.findNavController
import androidx.navigation.ui.setupWithNavController
import com.renegade.weas.R
import com.renegade.weas.databinding.ActivityMainBinding
import dagger.hilt.android.AndroidEntryPoint

@AndroidEntryPoint
class MainActivity : AppCompatActivity() {
    private lateinit var binding: ActivityMainBinding

    private val viewModel: MainActivityViewModel by viewModels()
    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        binding = ActivityMainBinding.inflate(layoutInflater)
        setContentView(binding.root)

        setUpNavControllerWithBottomNav()

    }

    override fun onStart() {
        super.onStart()

    }

    private fun setUpNavControllerWithBottomNav() {
        supportFragmentManager.findFragmentById(R.id.mainAct_container)?.let {
            binding.mainActBottomNavView.setupWithNavController(it.findNavController())
        }
    }
}