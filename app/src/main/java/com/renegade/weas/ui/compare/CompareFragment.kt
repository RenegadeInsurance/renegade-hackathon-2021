package com.renegade.weas.ui.compare

import android.os.Bundle
import android.view.LayoutInflater
import android.view.View
import android.view.ViewGroup
import androidx.fragment.app.Fragment
import com.renegade.weas.databinding.FragmentCompareBinding
import dagger.hilt.android.AndroidEntryPoint

@AndroidEntryPoint
class CompareFragment : Fragment() {
    private var _binding: FragmentCompareBinding? = null
    private val binding: FragmentCompareBinding get() = _binding!!

    override fun onCreateView(
        inflater: LayoutInflater, container: ViewGroup?,
        savedInstanceState: Bundle?
    ): View {
        _binding = FragmentCompareBinding.inflate(layoutInflater)
        return binding.root
    }

    override fun onDestroyView() {
        super.onDestroyView()
        _binding = null
    }
}