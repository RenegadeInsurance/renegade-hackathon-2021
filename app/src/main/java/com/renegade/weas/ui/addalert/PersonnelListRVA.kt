package com.renegade.weas.ui.addalert

import android.view.View
import android.view.ViewGroup
import androidx.recyclerview.widget.DiffUtil
import androidx.recyclerview.widget.ListAdapter
import androidx.recyclerview.widget.RecyclerView
import com.renegade.weas.network.requestbody.AlertBody

class PersonnelListRVA : ListAdapter<AlertBody, PersonnelListRVA.Holder>(PersonnelDiffCallback()) {
    class Holder(itemView: View) : RecyclerView.ViewHolder(itemView) {

    }

    override fun onCreateViewHolder(parent: ViewGroup, viewType: Int): Holder {

    }

    override fun onBindViewHolder(holder: Holder, position: Int) {
        TODO("Not yet implemented")
    }
}

class PersonnelDiffCallback : DiffUtil.ItemCallback<AlertBody>() {
    override fun areItemsTheSame(oldItem: AlertBody, newItem: AlertBody): Boolean {
        return oldItem.id == newItem.id
    }

    override fun areContentsTheSame(oldItem: AlertBody, newItem: AlertBody): Boolean {
        return (oldItem.id == newItem.id
                &&
                oldItem.email == newItem.email
                && oldItem.phone == newItem.phone
                && oldItem.relationShip == newItem.relationShip
                && oldItem.name == newItem.name)
    }

}