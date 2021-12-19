package com.renegade.weas.ui.addalert

import androidx.appcompat.app.AppCompatActivity
import android.os.Bundle
import androidx.activity.viewModels
import com.renegade.weas.R
import dagger.hilt.android.AndroidEntryPoint

@AndroidEntryPoint
class AddAlertPersonnelActivity : AppCompatActivity() {

    private val viewModel: AddAlertViewModel by viewModels()

    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        setContentView(R.layout.activity_add_alert_personnel)
    }
}