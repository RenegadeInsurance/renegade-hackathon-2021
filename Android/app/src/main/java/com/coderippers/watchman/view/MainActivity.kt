package com.coderippers.watchman.view

import android.content.Intent
import androidx.appcompat.app.AppCompatActivity
import android.os.Bundle
import androidx.databinding.DataBindingUtil
import com.coderippers.watchman.R
import com.coderippers.watchman.databinding.ActivityMainBinding

class MainActivity : AppCompatActivity() {

    private lateinit var binding: ActivityMainBinding

    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        binding = DataBindingUtil.setContentView(this, R.layout.activity_main)

        binding.weatherDataButton.setOnClickListener {
            val intent: Intent = Intent(this, WeatherDataActivity::class.java)
            startActivity(intent)
        }
    }
}