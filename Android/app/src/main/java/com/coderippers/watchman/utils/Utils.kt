package com.coderippers.watchman.utils

import com.coderippers.watchman.model.Location

fun formatLocation(location: Location): String {
    return "${location.city}, ${location.state}, ${location.country}"
}