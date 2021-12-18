package com.renegade.weas

import android.os.Bundle
import androidx.appcompat.app.AppCompatActivity
import androidx.navigation.fragment.findNavController
import androidx.navigation.ui.setupWithNavController
import com.google.firebase.auth.FirebaseAuth
import com.google.firebase.ktx.Firebase
import com.renegade.weas.databinding.ActivityMainBinding
import dagger.hilt.android.AndroidEntryPoint

@AndroidEntryPoint
class MainActivity : AppCompatActivity() {
    private lateinit var binding: ActivityMainBinding
    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        binding = ActivityMainBinding.inflate(layoutInflater)
        setContentView(binding.root)

        setUpNavControllerWithBottomNav()

    }

    private fun setUpNavControllerWithBottomNav() {
        supportFragmentManager.findFragmentById(R.id.mainAct_container)?.let {
            binding.mainActBottomNavView.setupWithNavController(it.findNavController())
        }
    }
}