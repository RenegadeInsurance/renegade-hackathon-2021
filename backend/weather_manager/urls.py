from django.urls import path

from weather_manager import views

urlpatterns = [
    path("weather-forecast/", views.get_weather_data, name="get_weather_data"),
    path("get-location-from-coordinates/", views.get_location_from_geo_location, name="get_location_from_geo_location"),
]
