package com.renegade.weas.ui.addalert

import android.os.Bundle
import android.view.LayoutInflater
import android.view.View
import android.widget.Toast
import androidx.activity.viewModels
import androidx.appcompat.app.AlertDialog
import androidx.appcompat.app.AppCompatActivity
import androidx.recyclerview.widget.LinearLayoutManager
import com.google.android.material.button.MaterialButton
import com.google.android.material.textfield.TextInputEditText
import com.renegade.weas.R
import com.renegade.weas.databinding.ActivityAddAlertPersonnelBinding
import com.renegade.weas.extensions.makeScreenNotTouchable
import com.renegade.weas.extensions.makeScreenTouchable
import com.renegade.weas.network.requestbody.AlertBody
import com.renegade.weas.network.safeapicall.Resource
import dagger.hilt.android.AndroidEntryPoint

@AndroidEntryPoint
class AddAlertPersonnelActivity : AppCompatActivity() {
    private lateinit var binding: ActivityAddAlertPersonnelBinding

    private val viewModel: AddAlertViewModel by viewModels()

    private val mAdapter = PersonnelListRVA()

    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)

        binding = ActivityAddAlertPersonnelBinding.inflate(layoutInflater)
        setUpRecyclerView()
        setContentView(binding.root)

        observeAlertList()

        binding.addAlertFAB.setOnClickListener {
            promptUserToAddAlertPersonnel()
        }

    }

    private fun promptUserToAddAlertPersonnel() {
        val dialogView = LayoutInflater
            .from(this)
            .inflate(R.layout.add_alert_group_layout, null)

        val alertDialog = AlertDialog.Builder(
            this
        ).setView(dialogView).create()
        alertDialog.window!!.attributes.windowAnimations =
            R.style.Animation_Design_BottomSheetDialog
        alertDialog.window!!.setBackgroundDrawableResource(android.R.color.transparent)

        setUpView(dialogView, alertDialog)

        alertDialog.show()
    }

    private fun setUpView(dialogView: View, alertDialog: AlertDialog) {

        dialogView.findViewById<MaterialButton>(R.id.alert_grp_add).setOnClickListener {
            viewModel.addAlertPersonnel(
                AlertBody(
                    dialogView.findViewById<TextInputEditText>(R.id.alert_grp_name).text.toString(),
                    dialogView.findViewById<TextInputEditText>(R.id.alert_grp_relation).text.toString(),
                    dialogView.findViewById<TextInputEditText>(R.id.alert_grp_email).text.toString(),
                    dialogView.findViewById<TextInputEditText>(R.id.alert_grp_phone).text.toString(),
                )
            )
            alertDialog.dismiss()
        }
    }


    private fun observeAlertList() {
        viewModel.alertListLiveData.observe(this) { alertBodyListResource ->
            when (alertBodyListResource) {
                is Resource.Success -> {
                    binding.addAlertProgressBar.visibility = View.INVISIBLE
                    makeScreenTouchable()
                    if (alertBodyListResource.value?.isEmpty() == true) {
                        binding.addAlertAddSomeAlertTV.visibility = View.VISIBLE
                    } else {
                        binding.addAlertAddSomeAlertTV.visibility = View.INVISIBLE
                    }
                    mAdapter.submitList(alertBodyListResource.value)
                }
                is Resource.Failure -> {
                    makeScreenTouchable()
                    binding.addAlertProgressBar.visibility = View.INVISIBLE
                    Toast.makeText(this, "Something went wrong", Toast.LENGTH_LONG).show()
                    finish()
                }
                is Resource.Loading -> {
                    makeScreenNotTouchable()
                    binding.addAlertProgressBar.visibility = View.VISIBLE

                }
            }
        }

    }


    override fun onResume() {
        super.onResume()
        viewModel.getAlertPersonnel()
    }

    private fun setUpRecyclerView() {
        binding.alertListRV.adapter = mAdapter
        binding.alertListRV.layoutManager = LinearLayoutManager(this)
    }
}