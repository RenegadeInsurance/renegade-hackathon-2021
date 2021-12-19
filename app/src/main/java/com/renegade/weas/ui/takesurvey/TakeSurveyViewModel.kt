package com.renegade.weas.ui.takesurvey

import androidx.lifecycle.LiveData
import androidx.lifecycle.MutableLiveData
import androidx.lifecycle.ViewModel
import androidx.lifecycle.viewModelScope
import com.renegade.weas.network.response.questionresponse.QuestionResponse
import com.renegade.weas.network.safeapicall.Resource
import com.renegade.weas.repo.MainRepository
import dagger.hilt.android.lifecycle.HiltViewModel
import kotlinx.coroutines.launch
import javax.inject.Inject

@HiltViewModel
class TakeSurveyViewModel
@Inject
constructor(
    private val mainRepository: MainRepository
) : ViewModel() {

    private val _questionLiveData = MutableLiveData<Resource<QuestionResponse>>()
    val questionLiveData: LiveData<Resource<QuestionResponse>> get() = _questionLiveData

    fun getFirstQuestion() {
        _questionLiveData.value = Resource.Loading
        viewModelScope.launch {
            _questionLiveData.value = mainRepository.getFirstQuestion()
        }
    }

    fun getNextQuestion(questionID: Int, answerID: Int) {
        viewModelScope.launch {
            _questionLiveData.value = mainRepository.getNextQuestion(questionID, answerID)
        }
    }
}