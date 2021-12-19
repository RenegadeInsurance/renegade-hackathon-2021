package com.coderippers.watchman.adapter

import android.view.LayoutInflater
import android.view.ViewGroup
import androidx.recyclerview.widget.DiffUtil
import androidx.recyclerview.widget.ListAdapter
import androidx.recyclerview.widget.RecyclerView
import com.coderippers.watchman.databinding.LocationDataEntryPopupBinding
import com.coderippers.watchman.databinding.OtherLocationsListItemBinding
import com.coderippers.watchman.model.Location
import com.coderippers.watchman.utils.formatLocation

class OtherLocationAdapter(private val clickListener: LocationRemoveListener): ListAdapter<Location, OtherLocationAdapter.OtherLocationListViewHolder>(LocationDiffUtil()) {
    class LocationDiffUtil: DiffUtil.ItemCallback<Location>() {
        override fun areItemsTheSame(oldItem: Location, newItem: Location): Boolean {
            return oldItem == newItem
        }

        override fun areContentsTheSame(oldItem: Location, newItem: Location): Boolean {
            return oldItem == newItem
        }
    }

    override fun onCreateViewHolder(parent: ViewGroup, viewType: Int): OtherLocationListViewHolder {
        return OtherLocationListViewHolder.from(parent)
    }

    override fun onBindViewHolder(holder: OtherLocationListViewHolder, position: Int) {
        val item = getItem(position)
        holder.binding(item, clickListener)
    }

    class OtherLocationListViewHolder(val binding: OtherLocationsListItemBinding): RecyclerView.ViewHolder(binding.root) {
        fun binding(item: Location, clickListener: LocationRemoveListener) {
            binding.location = formatLocation(item)
            binding.removeLocation.setOnClickListener {
                clickListener.onClick(item)
            }
            binding.executePendingBindings()
        }

        companion object {
            fun from(parent: ViewGroup) : OtherLocationListViewHolder {
                val layoutInflater = LayoutInflater.from(parent.context)
                val binding = OtherLocationsListItemBinding.inflate(layoutInflater, parent, false)
                return OtherLocationListViewHolder(binding)
            }
        }
    }
}

class LocationRemoveListener(val clickListener: (Location) -> Unit) {
    fun onClick(location: Location) = clickListener(location)
}