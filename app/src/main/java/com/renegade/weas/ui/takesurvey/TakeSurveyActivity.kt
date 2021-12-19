package com.renegade.weas.ui.takesurvey

import android.app.Activity
import android.os.Bundle
import android.view.Menu
import android.view.MenuItem
import android.view.View
import android.widget.Toast
import androidx.activity.viewModels
import androidx.appcompat.app.AppCompatActivity
import com.renegade.weas.R
import com.renegade.weas.databinding.ActivityTakeSurveyBinding
import com.renegade.weas.extensions.makeScreenNotTouchable
import com.renegade.weas.extensions.makeScreenTouchable
import com.renegade.weas.network.response.questionresponse.QuestionResponse
import com.renegade.weas.network.safeapicall.Resource
import dagger.hilt.android.AndroidEntryPoint

@AndroidEntryPoint
class TakeSurveyActivity : AppCompatActivity() {
    private lateinit var binding: ActivityTakeSurveyBinding
    private lateinit var questionLayoutHandler: QuestionLayoutHandler

    private val viewModel: TakeSurveyViewModel by viewModels()

    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        binding = ActivityTakeSurveyBinding.inflate(layoutInflater)
        questionLayoutHandler =
            QuestionLayoutHandler(
                binding.takeSurveyActQuestionLayout
            ) { questionID, answerID ->
                viewModel.getNextQuestion(questionID, answerID)
            }
        setContentView(binding.root)
        supportActionBar?.setDisplayHomeAsUpEnabled(true)
        setUpObserverForQuestion()

        if (viewModel.questionLiveData.value == null) {
            askForFirstQuestion()
        }

    }


    private fun setUpObserverForQuestion() {
        viewModel.questionLiveData.observe(this) { questionResource ->
            when (questionResource) {
                is Resource.Success -> {
                    binding.takeSurveyActProgressBar.visibility = View.INVISIBLE
                    makeScreenTouchable()
                    questionResource.value?.let { setUpQuestion(it) }
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

    private fun setUpAnswers(value: QuestionResponse) {
        questionLayoutHandler.setUpAnswers(value.answers)
    }

    private fun setUpQuestion(value: QuestionResponse) {
        //Means we got result from the server
        if (value.id == -1) {
            intent.putExtra("risk", value.question)
            setResult(Activity.RESULT_OK, intent)
            finish()
        } else {
            questionLayoutHandler.writeQuestion(value.question, value.id)
            setUpAnswers(value)
        }
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

    override fun onCreateOptionsMenu(menu: Menu): Boolean {
        menuInflater.inflate(R.menu.mainact_bottom_nav_menu, menu)
        return true
    }


}