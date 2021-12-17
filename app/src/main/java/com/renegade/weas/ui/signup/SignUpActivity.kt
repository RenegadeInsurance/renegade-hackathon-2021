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

        binding.signUpBtn.setOnClickListener {
            binding.loadingSignUp.visibility = View.VISIBLE
            auth.createUserWithEmailAndPassword(
                binding.usernameSignUp.text.toString(),
                binding.passwordSignUp.text.toString()
            ).addOnCompleteListener { task ->
                if (task.isSuccessful) {
                    startActivity(
                        Intent(this, MainActivity::class.java)
                    )
                    finish()
                } else {
                    Toast.makeText(this, "Sign Up Failed.", Toast.LENGTH_LONG).show()
                }
                binding.loadingSignUp.visibility = View.INVISIBLE

            }
        }

        binding.logInTV.setOnClickListener{
            finish()
        }

    }
}