package com.renegade.weas.ui.home

import android.app.Activity
import android.app.AlertDialog
import android.content.Intent
import android.os.Bundle
import android.util.Log
import android.view.LayoutInflater
import android.view.View
import android.view.ViewGroup
import androidx.activity.result.contract.ActivityResultContracts
import androidx.fragment.app.Fragment
import androidx.fragment.app.activityViewModels
import com.renegade.weas.databinding.FragmentHomeBinding
import com.renegade.weas.network.safeapicall.Resource
import com.renegade.weas.ui.MainActivityViewModel
import com.renegade.weas.ui.takesurvey.TakeSurveyActivity
import dagger.hilt.android.AndroidEntryPoint

private const val TAG = "HomeFragment"

@AndroidEntryPoint
class HomeFragment : Fragment() {
    private var _binding: FragmentHomeBinding? = null
    private val binding: FragmentHomeBinding get() = _binding!!
    private lateinit var weatherLayoutHandler: WeatherLayoutHandler
    private val sharedViewModel: MainActivityViewModel by activityViewModels()

//    private val c = registerForActivityResult(ActivityResultContracts.StartActivityForResult()){result->
//        if (result.resultCode == Activity.RESULT_OK){
//            val risk = result.data
//
//            AlertDialog.Builder(requireContext())
//                .setTitle("Your Flood Risk!")
//                .setMessage()
//        }
//    }


    override fun onCreateView(
        inflater: LayoutInflater, container: ViewGroup?,
        savedInstanceState: Bundle?
    ): View {
        _binding = FragmentHomeBinding.inflate(layoutInflater)
        weatherLayoutHandler = WeatherLayoutHandler(binding.weatherLayout)
        sharedViewModel.weatherLiveData.observe(viewLifecycleOwner) { weatherResponse ->
            when (weatherResponse) {
                is Resource.Success -> {
                    weatherResponse.value?.let { weatherLayoutHandler.updateValues(it) }
                }
                is Resource.Failure -> {
                    Log.e(TAG, "onCreateView: Something went wrong")
                }
                is Resource.Loading -> {

                }
            }

        }
        sharedViewModel.getWeather(10.0, 10.0)

        setClickListenerForTakeSurveyBtn()

        return binding.root
    }

    private fun setClickListenerForTakeSurveyBtn() {
        binding.homeFrgTakeSurveyBtn.setOnClickListener {
            startActivity(Intent(requireActivity(), TakeSurveyActivity::class.java))
        }
    }

    override fun onDestroyView() {
        super.onDestroyView()
        _binding = null
    }
}