from django.urls import path

from alert_manager import views

urlpatterns = [
    path("register-for-notification/", views.register_for_notification, name="register_for_notification"),
]
