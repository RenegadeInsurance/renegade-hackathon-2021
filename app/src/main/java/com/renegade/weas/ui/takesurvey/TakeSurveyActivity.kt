package com.renegade.weas.ui.takesurvey

import android.os.Bundle
import androidx.appcompat.app.AppCompatActivity
import com.renegade.weas.databinding.ActivityTakeSurveyBinding


class TakeSurveyActivity : AppCompatActivity() {
    private lateinit var binding: ActivityTakeSurveyBinding
    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        binding = ActivityTakeSurveyBinding.inflate(layoutInflater)
        setContentView(binding.root)
    }
}