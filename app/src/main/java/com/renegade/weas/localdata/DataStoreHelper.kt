package com.renegade.weas.localdata

import android.content.Context
import androidx.datastore.preferences.core.Preferences
import androidx.datastore.preferences.core.booleanPreferencesKey
import androidx.datastore.preferences.core.edit
import androidx.datastore.preferences.core.stringPreferencesKey
import androidx.datastore.preferences.preferencesDataStore
import dagger.hilt.android.qualifiers.ApplicationContext
import kotlinx.coroutines.flow.Flow
import kotlinx.coroutines.flow.map
import javax.inject.Inject

const val DATA_STORE_NAME = "datastore"


private val Context.dataStore by preferencesDataStore(DATA_STORE_NAME)

class DataStoreHelper @Inject constructor(@ApplicationContext appContext: Context) {

    private val dataStore = appContext.dataStore

    private val accessTokenKey = stringPreferencesKey("ACCESS_TOKEN")
    private val autoSyncKey = booleanPreferencesKey("AUTO_SYNC")


    ///For Access Token
    fun getAccessToken(): Flow<String> {
        return dataStore.data.map { store ->
            store[accessTokenKey] ?: ""
        }
    }

    suspend fun setAccessToken(token: String) {
        editStore(accessTokenKey, token)
    }

    suspend fun clearAccessToken() {
        setAccessToken("")
    }


    //Generic function for editing data store.
    private suspend fun <T> editStore(key: Preferences.Key<T>, value: T) {
        dataStore.edit { store ->
            store[key] = value
        }
    }

}