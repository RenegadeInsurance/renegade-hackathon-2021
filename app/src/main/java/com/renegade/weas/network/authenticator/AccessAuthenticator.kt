package com.renegade.weas.network.authenticator


import android.content.Context
import android.content.Intent
import android.util.Log
import android.widget.Toast
import com.renegade.weas.localdata.DataStoreHelper
import com.renegade.weas.ui.login.LoginActivity
import dagger.hilt.android.qualifiers.ApplicationContext

import kotlinx.coroutines.runBlocking
import okhttp3.Authenticator
import okhttp3.Request
import okhttp3.Response
import okhttp3.Route
import javax.inject.Inject


private const val TAG = "AccessAuthenticator"

class AccessAuthenticator
@Inject constructor(
    private val dataStoreHelper: DataStoreHelper,
    @ApplicationContext private val appContext: Context,
) : Authenticator {


    override fun authenticate(route: Route?, response: Response): Request? {
        return runBlocking {
            dataStoreHelper.clearAccessToken()
            startAuthActivity(appContext)
            null
        }
    }


    private fun startAuthActivity(appContext: Context) {
        val intent = Intent(appContext, LoginActivity::class.java)
        intent.flags = Intent.FLAG_ACTIVITY_NEW_TASK or Intent.FLAG_ACTIVITY_CLEAR_TASK
        appContext.startActivity(intent)
    }

}



