from django.urls import path

from location_manager import views

urlpatterns = [
    path("location-list/", views.location_list, name="locations"),
]
