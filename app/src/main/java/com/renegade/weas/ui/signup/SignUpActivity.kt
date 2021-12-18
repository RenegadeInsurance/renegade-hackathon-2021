package com.renegade.weas.ui.signup

import android.content.Intent
import androidx.appcompat.app.AppCompatActivity
import android.os.Bundle
import android.view.View
import android.widget.Toast
import androidx.activity.viewModels
import com.google.firebase.auth.ktx.auth
import com.google.firebase.ktx.Firebase
import com.renegade.weas.MainActivity
import com.renegade.weas.databinding.ActivitySignUpBinding
import com.renegade.weas.network.requestbody.SignUpBody
import com.renegade.weas.network.safeapicall.Resource
import dagger.hilt.android.AndroidEntryPoint

@AndroidEntryPoint
class SignUpActivity : AppCompatActivity() {
    private val viewModel: SignUpViewModel by viewModels()

    private lateinit var binding: ActivitySignUpBinding
    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        binding = ActivitySignUpBinding.inflate(layoutInflater)
        setContentView(binding.root)

        viewModel.signUpLiveData.observe(this) {
            when (it) {
                is Resource.Success -> {
                    binding.signUpActProgressBar.visibility = View.INVISIBLE
                    Toast.makeText(this, "Sign Up Successfull", Toast.LENGTH_SHORT).show()
                    finish()
                }
                is Resource.Failure -> {
                    binding.signUpActProgressBar.visibility = View.INVISIBLE
                    Toast.makeText(this, "Something went wrong", Toast.LENGTH_LONG).show()
                }
                is Resource.Loading -> {
                    binding.signUpActProgressBar.visibility = View.VISIBLE

                }
            }

        }

        binding.signUpActEmailET.setText("diken@gmail.com")
        binding.signUpActPasswordET.setText("123456")
        binding.signUpActPhoneNumET.setText("980303")
        binding.signUpActFNameET.setText("Diken")
        binding.signUpActProvinceET.setText("4")
        binding.signUpActLNameET.setText("Maharjan")
        binding.signUpActCityET.setText("Lalitpur")

        binding.signUpActSignUpBtn.setOnClickListener {
            val email = binding.signUpActEmailET.text.toString()
            val password = binding.signUpActEmailET.text.toString()
            val fName = binding.signUpActFNameET.text.toString()
            val lName = binding.signUpActLNameET.text.toString()
            val province = binding.signUpActProvinceET.text.toString()
            val city = binding.signUpActCityET.text.toString()
            val phone = binding.signUpActPhoneNumET.text.toString()



            viewModel.signUp(
                SignUpBody(
                    email, password, fName, lName, province, city, phone
                )
            )

        }


    }
}