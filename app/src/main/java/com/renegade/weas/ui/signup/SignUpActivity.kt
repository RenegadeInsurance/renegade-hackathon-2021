package com.renegade.weas.ui.signup

import android.content.Intent
import androidx.appcompat.app.AppCompatActivity
import android.os.Bundle
import android.view.View
import android.widget.Toast
import com.google.firebase.auth.ktx.auth
import com.google.firebase.ktx.Firebase
import com.renegade.weas.MainActivity
import com.renegade.weas.databinding.ActivitySignUpBinding

class SignUpActivity : AppCompatActivity() {
    private val auth = Firebase.auth

    private lateinit var binding: ActivitySignUpBinding
    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        binding = ActivitySignUpBinding.inflate(layoutInflater)
        setContentView(binding.root)


        binding.logInTV.setOnClickListener{
            finish()
        }

    }
}