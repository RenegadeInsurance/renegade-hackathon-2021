package com.renegade.weas.ui.login

import android.content.Intent
import android.os.Bundle
import android.view.View
import android.widget.Toast
import androidx.activity.viewModels
import androidx.appcompat.app.AppCompatActivity
import com.renegade.weas.databinding.ActivityLoginBinding
import com.renegade.weas.extensions.makeScreenNotTouchable
import com.renegade.weas.extensions.makeScreenTouchable
import com.renegade.weas.network.requestbody.LoginBody
import com.renegade.weas.network.safeapicall.Resource
import com.renegade.weas.ui.main.MainActivity
import com.renegade.weas.ui.signup.SignUpActivity
import dagger.hilt.android.AndroidEntryPoint


@AndroidEntryPoint
class LoginActivity : AppCompatActivity() {
    private lateinit var binding: ActivityLoginBinding

    private val viewModel by viewModels<LoginViewModel>()
    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        binding = ActivityLoginBinding.inflate(layoutInflater)
        setContentView(binding.root)

        setListenerForLogInLiveData()

        setClickListenerForLogInBtn()

        binding.loginActSignUpTV.setOnClickListener {
            startActivity(Intent(this, SignUpActivity::class.java))
        }
        binding.loginActEmailTV.setText("diken@gmail.com")
        binding.loginActPasswordTV.setText("testpassword")
    }

    private fun setListenerForLogInLiveData() {
        viewModel.loginLiveData.observe(this) {
            when (it) {
                is Resource.Success -> {
                    binding.loginActProgressBar.visibility = View.INVISIBLE
                    makeScreenTouchable()
                    viewModel.storeAccessToken(it.value?.token)
                    startActivity(Intent(this, MainActivity::class.java))
                    finish()
                }
                is Resource.Failure -> {
                    makeScreenTouchable()
                    binding.loginActProgressBar.visibility = View.INVISIBLE
                    if (it.isUnknownError) {
                        Toast.makeText(this, "Something went wrong", Toast.LENGTH_LONG).show()
                    } else {
                        Toast.makeText(this, it.errorMsg, Toast.LENGTH_LONG).show()
                    }
                }
                is Resource.Loading -> {
                    makeScreenNotTouchable()
                    binding.loginActProgressBar.visibility = View.VISIBLE
                }

            }
        }
    }

    private fun setClickListenerForLogInBtn() {
        binding.loginActSignInBtn.setOnClickListener {
            viewModel.logIn(
                LoginBody(
                    binding.loginActEmailTV.text.toString(),
                    binding.loginActPasswordTV.text.toString()
                )
            )
        }

    }
}