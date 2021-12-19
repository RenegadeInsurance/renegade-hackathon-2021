package com.coderippers.watchman.view

import android.app.AlertDialog
import android.content.Context
import android.view.LayoutInflater
import android.view.View
import android.widget.Toast
import androidx.databinding.DataBindingUtil
import com.coderippers.watchman.R
import com.coderippers.watchman.databinding.LocationDataEntryPopupBinding
import com.coderippers.watchman.model.Location

class LocationEntryPopup(private val mContext: Context, val listener: LocationDataListener) {
    private val alert: AlertDialog.Builder = AlertDialog.Builder(mContext)
    private val binding: LocationDataEntryPopupBinding
    private val alertDialog: AlertDialog

    init {
        val layoutInflater: LayoutInflater = LayoutInflater.from(mContext)
        binding = DataBindingUtil.inflate(layoutInflater,
            R.layout.location_data_entry_popup,
            null,
            false)
        alert.setView(binding.root)
        alertDialog = alert.create()
        alertDialog.setCanceledOnTouchOutside(false)
        alertDialog.window!!.setBackgroundDrawableResource(android.R.color.transparent)

        binding.cancelButton.setOnClickListener {
            alertDialog.dismiss()
        }

        binding.confirmButton.setOnClickListener {
            onConfirmButtonClicked()
        }

        alertDialog.show()
    }

    private fun onConfirmButtonClicked() {
        val city = binding.cityEditText.text.toString()
        val state = binding.stateEditText.text.toString()
        val country = binding.countryEditText.text.toString()

        when {
            city.trim().isEmpty() -> {
                Toast.makeText(mContext, "Please enter the city", Toast.LENGTH_LONG).show()
            }
            state.trim().isEmpty() -> {
                Toast.makeText(mContext, "Please enter the state", Toast.LENGTH_LONG).show()
            }
            country.trim().isEmpty() -> {
                Toast.makeText(mContext, "Please enter the country", Toast.LENGTH_LONG).show()
            }
            else -> {
                alertDialog.dismiss()
                listener.onConfirm(Location(city, state, country))
            }
        }
    }
}

interface LocationDataListener {
    fun onConfirm(location: Location)
}