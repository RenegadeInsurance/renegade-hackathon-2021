from django.urls import path

from alert_manager import views

urlpatterns = [
    path("register-for-notification/", views.register_for_notification, name="register_for_notification"),
    path("register-alert-personnel/", views.register_alert_personnel, name="register_alert_personnel"),
    path("run/", views.run_weather_scraper, name="run_weather_scraper"),
]
