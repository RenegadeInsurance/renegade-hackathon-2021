package com.renegade.weas.ui.takesurvey

import android.os.Bundle
import android.view.MenuItem
import androidx.activity.viewModels
import androidx.appcompat.app.AppCompatActivity
import com.renegade.weas.databinding.ActivityTakeSurveyBinding
import dagger.hilt.android.AndroidEntryPoint

@AndroidEntryPoint
class TakeSurveyActivity : AppCompatActivity() {
    private lateinit var binding: ActivityTakeSurveyBinding

    private val viewModel: TakeSurveyViewModel by viewModels()
    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        binding = ActivityTakeSurveyBinding.inflate(layoutInflater)
        setContentView(binding.root)
        supportActionBar?.setDisplayHomeAsUpEnabled(true)
    }

    override fun onOptionsItemSelected(item: MenuItem): Boolean {
        if (item.itemId == android.R.id.home) {
            super.onBackPressed()
        }
        return super.onOptionsItemSelected(item)
    }


}