package com.renegade.weas.ui.login

import android.content.Intent
import androidx.appcompat.app.AppCompatActivity
import android.os.Bundle
import com.renegade.weas.R
import com.renegade.weas.databinding.ActivityLoginBinding
import com.renegade.weas.databinding.ActivityMainBinding
import com.renegade.weas.ui.signup.SignUpActivity

class LoginActivity : AppCompatActivity() {
    private lateinit var binding: ActivityLoginBinding
    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        binding = ActivityLoginBinding.inflate(layoutInflater)
        setContentView(binding.root)

        binding.loginActSignUpTV.setOnClickListener {
            startActivity(Intent(this, SignUpActivity::class.java))
        }
    }
}