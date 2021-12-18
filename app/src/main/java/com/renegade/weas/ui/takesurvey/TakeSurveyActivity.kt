package com.renegade.weas.ui.takesurvey

import android.os.Bundle
import android.view.MenuItem
import android.view.View
import android.widget.Toast
import androidx.activity.viewModels
import androidx.appcompat.app.AppCompatActivity
import com.renegade.weas.databinding.ActivityTakeSurveyBinding
import com.renegade.weas.extensions.makeScreenNotTouchable
import com.renegade.weas.extensions.makeScreenTouchable
import com.renegade.weas.network.response.questionresponse.QuestionResponse
import com.renegade.weas.network.safeapicall.Resource
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
        setUpObserverForQuestion()
        askForFirstQuestion()
    }

    private fun setUpObserverForQuestion() {
        viewModel.questionLiveData.observe(this) { questionResource ->
            when (questionResource) {
                is Resource.Success -> {
                    binding.takeSurveyActProgressBar.visibility = View.INVISIBLE
                    makeScreenTouchable()
                    setUpQuestion(questionResource.value)
                    setUpAnswers(questionResource.value)
                }
                is Resource.Failure -> {
                    binding.takeSurveyActProgressBar.visibility = View.INVISIBLE
                    makeScreenTouchable()
                    Toast.makeText(
                        this,
                        "Something went wrong. Take survey after some time.",
                        Toast.LENGTH_LONG
                    ).show()
                    finish()
                }
                is Resource.Loading -> {
                    binding.takeSurveyActProgressBar.visibility = View.VISIBLE
                    makeScreenNotTouchable()
                }
            }
        }
    }

    private fun setUpAnswers(value: QuestionResponse?) {

    }

    private fun setUpQuestion(value: QuestionResponse?) {

    }

    private fun askForFirstQuestion() {
        viewModel.getFirstQuestion()
    }

    override fun onOptionsItemSelected(item: MenuItem): Boolean {
        if (item.itemId == android.R.id.home) {
            super.onBackPressed()
        }
        return super.onOptionsItemSelected(item)
    }


}