package com.renegade.weas.ui.takesurvey

import android.util.TypedValue
import android.widget.RadioButton
import android.widget.RadioGroup
import android.widget.Toast
import androidx.core.view.setPadding
import com.renegade.weas.R
import com.renegade.weas.databinding.QuestionLayoutBinding
import com.renegade.weas.network.response.questionresponse.Answer

class QuestionLayoutHandler(
    private val binding: QuestionLayoutBinding,
    private val requestNextQuestion: (questionID: Int, answerID: Int) -> Unit
) {

    private var questionID: Int? = null

    init {
        binding.questionLayoutNextBtn.setOnClickListener {
            val selectedId = binding.questionLayoutAnswersRadioGroup.checkedRadioButtonId
            if (selectedId == -1) {
                Toast.makeText(binding.root.context, "Please Select An Answer", Toast.LENGTH_LONG)
                    .show()
            } else {
                requestNextQuestion(
                    questionID!!,
                    binding.questionLayoutAnswersRadioGroup.checkedRadioButtonId
                )
                binding.questionLayoutAnswersRadioGroup.clearCheck()
            }
        }
    }

    fun writeQuestion(question: String, questionID: Int) {
        this.questionID = questionID
        binding.questionLayoutQuestionTV.text = question
    }

    fun setUpAnswers(answerList: List<Answer>) {
        binding.questionLayoutAnswersRadioGroup.removeAllViews()
        answerList.forEach { answer ->
            val radioButton = getRadioButton(answer.answer, answer.id)
            binding.questionLayoutAnswersRadioGroup.addView(radioButton)
        }
    }

    private fun getRadioButton(answer: String, id: Int): RadioButton {
        return RadioButton(binding.root.context).apply {
            layoutParams = RadioGroup.LayoutParams(
                RadioGroup.LayoutParams.MATCH_PARENT,
                RadioGroup.LayoutParams.WRAP_CONTENT
            ).apply {
                setMargins(0, dpToPx(44F), 0, 0)
            }
            setPadding(dpToPx(46F))
            text = answer
            setBackgroundResource(R.drawable.radio_button_background)
            this.id = id
        }

    }

    private fun dpToPx(px: Float): Int {
        return TypedValue.applyDimension(
            TypedValue.COMPLEX_UNIT_PX,
            px,
            binding.root.context.resources.displayMetrics
        ).toInt()
    }

}