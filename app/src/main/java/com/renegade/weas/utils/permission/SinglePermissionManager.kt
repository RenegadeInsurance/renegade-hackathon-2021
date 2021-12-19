package com.renegade.weas.utils.permission/*
 * Created by Diken Mhrz
 *  Copyright (c) 2021 Sunya Health Solution Pvt. Ltd . All rights reserved.
 *  Last modified 12/14/21, 6:21 PM
 */

import android.content.pm.PackageManager
import android.widget.Toast
import androidx.activity.ComponentActivity
import androidx.activity.result.ActivityResultLauncher
import androidx.activity.result.contract.ActivityResultContracts
import androidx.appcompat.app.AlertDialog
import androidx.core.app.ActivityCompat.shouldShowRequestPermissionRationale
import androidx.core.content.ContextCompat

class SinglePermissionManager(
    private val activity: ComponentActivity,
    private val classImplementingIOnPermissionAllowed: IOnPermissionAllowed,
    private val permissionNameGivenByAndroid: String,
    private val permissionName: String,
    private val causeOfPermissionNecessity: String

) {
    private val requestCameraPermissionLauncher = getPermissionLauncher()

    fun carryOutAllTheNecessaryThingsForManagingPermission() {
        when {
            hasPermission(permissionNameGivenByAndroid) -> {
                classImplementingIOnPermissionAllowed.permissionAllowed()
            }
            shouldShowRequestPermissionRationale(activity, permissionNameGivenByAndroid) -> {
                showDialogInformingUserAboutPermissionImportance()
            }
            else -> {
                askPermission()
            }
        }
    }

    private fun hasPermission(permission: String) =
        ContextCompat.checkSelfPermission(
            activity, permission
        ) == PackageManager.PERMISSION_GRANTED

    private fun showDialogInformingUserAboutPermissionImportance() {
        AlertDialog.Builder(activity)
            .setTitle("Requires $permissionName permission!!")
            .setMessage(causeOfPermissionNecessity)
            .setCancelable(false)
            .setPositiveButton("Yes") { _, _ -> askPermission() }
            .setNegativeButton("No, Thanks") { _, _ -> noPermissionGiven() }
            .create().show()
    }


    private fun noPermissionGiven() {
        AlertDialog.Builder(activity)
            .setTitle("Requires $permissionName permission!!")
            .setCancelable(false)
            .setMessage("Please go to settings and give $permissionName permission!")
            .setPositiveButton("Ok") { _, _ -> bidGoodByeToUser() }
            .create().show()
    }

    private fun bidGoodByeToUser() {
        Toast.makeText(activity, "See you again!", Toast.LENGTH_LONG).show()
        activity.finish()
    }

    private fun askPermission() {
        requestCameraPermissionLauncher.launch(permissionNameGivenByAndroid)
    }


    private fun getPermissionLauncher(): ActivityResultLauncher<String> {
        return activity.registerForActivityResult(
            ActivityResultContracts.RequestPermission()
        ) { granted ->
            if (granted) {
                classImplementingIOnPermissionAllowed.permissionAllowed()
            } else {
                if (shouldShowRequestPermissionRationale(activity, permissionNameGivenByAndroid)) {
                    showDialogInformingUserAboutPermissionImportance()
                } else {
                    noPermissionGiven()
                }
            }
        }

    }


}