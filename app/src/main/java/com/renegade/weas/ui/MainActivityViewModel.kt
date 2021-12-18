package com.renegade.weas.ui

import androidx.lifecycle.ViewModel
import com.renegade.weas.repo.MainRepository
import dagger.hilt.android.lifecycle.HiltViewModel
import javax.inject.Inject


@HiltViewModel
class MainActivityViewModel
@Inject
constructor(
    private val mainRepository: MainRepository
) : ViewModel() {

    fun logout(){
        mainRepository.logOut()
    }

}