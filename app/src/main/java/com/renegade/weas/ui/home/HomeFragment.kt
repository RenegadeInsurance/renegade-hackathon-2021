package com.renegade.weas.ui.home

import android.os.Bundle
import android.util.Log
import androidx.fragment.app.Fragment
import android.view.LayoutInflater
import android.view.View
import android.view.ViewGroup
import androidx.fragment.app.activityViewModels
import com.renegade.weas.R
import com.renegade.weas.databinding.FragmentHomeBinding
import com.renegade.weas.network.safeapicall.Resource
import com.renegade.weas.ui.MainActivityViewModel
import dagger.hilt.android.AndroidEntryPoint
import kotlin.math.log

private const val TAG = "HomeFragment"
@AndroidEntryPoint
class HomeFragment : Fragment() {
    private var _binding: FragmentHomeBinding? = null
    private val binding: FragmentHomeBinding get() = _binding!!

    private val sharedViewModel: MainActivityViewModel by activityViewModels()

    override fun onCreateView(
        inflater: LayoutInflater, container: ViewGroup?,
        savedInstanceState: Bundle?
    ): View {
        _binding = FragmentHomeBinding.inflate(layoutInflater)
        sharedViewModel.weatherLiveData.observe(viewLifecycleOwner){weatherResponse->
            when(weatherResponse){
                is Resource.Success->{
                    Log.e(TAG, "onCreateView: ${weatherResponse.value?.base}", )
                }
                is Resource.Failure->{
                    Log.e(TAG, "onCreateView: Something went wrong", )
                }
                is Resource.Loading->{

                }
                    
                
            }
            
        }
        sharedViewModel.getWeather(10.0, 10.0)
        // Inflate the layout for this fragment
        return binding.root
    }

    override fun onDestroyView() {
        super.onDestroyView()
        _binding = null
    }
}