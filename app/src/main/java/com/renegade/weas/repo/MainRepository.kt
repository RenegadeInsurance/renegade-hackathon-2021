package com.renegade.weas.repo

import com.google.firebase.auth.FirebaseAuth
import javax.inject.Inject

class MainRepository
@Inject
constructor(
    private val auth: FirebaseAuth
) {

    fun logOut() {
        auth.signOut()
    }
}