package com.renegade.weas.ui.signup

import android.os.Bundle
import android.view.View
import android.widget.Toast
import androidx.activity.viewModels
import androidx.appcompat.app.AppCompatActivity
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

        observeSignUpLiveData()

        setClickListenerForSignUp()


        fillUpDummyData()


        binding.signUpActLogInTV.setOnClickListener {
            finish()
        }

    }

    private fun fillUpDummyData() {
        binding.signUpActEmailET.setText("diken@gmail.com")
        binding.signUpActPasswordET.setText("123456")
        binding.signUpActFNameET.setText("diken")
        binding.signUpActLNameET.setText("maharjan")
        binding.signUpActProvinceET.setText("4")
        binding.signUpActCityET.setText("lalitpur")
        binding.signUpActPhoneNumET.setText("98093093")
    }

    private fun setClickListenerForSignUp() {
        binding.signUpActSignUpBtn.setOnClickListener {
            viewModel.signUp(
                SignUpBody(
                    binding.signUpActEmailET.text.toString(),
                    binding.signUpActPasswordET.text.toString(),
                    binding.signUpActFNameET.text.toString(),
                    binding.signUpActLNameET.text.toString(),
                    binding.signUpActProvinceET.text.toString(),
                    binding.signUpActCityET.text.toString(),
                    binding.signUpActPhoneNumET.text.toString()
                )
            )
        }
    }


    private fun observeSignUpLiveData() {
        viewModel.signUpLiveData.observe(this) {
            when (it) {
                is Resource.Success -> {
                    binding.signUpActProgressBar.visibility = View.INVISIBLE
                    Toast.makeText(this, "Sign Up Successfull", Toast.LENGTH_SHORT).show()
                    finish()
                }
                is Resource.Failure -> {
                    binding.signUpActProgressBar.visibility = View.INVISIBLE
                    if (it.isUnknownError) {
                        Toast.makeText(this, "Something went wrong", Toast.LENGTH_LONG).show()
                    } else {
                        Toast.makeText(this, it.errorMsg, Toast.LENGTH_LONG).show()
                    }
                }
                is Resource.Loading -> {
                    binding.signUpActProgressBar.visibility = View.VISIBLE

                }
            }
        }


    }
}