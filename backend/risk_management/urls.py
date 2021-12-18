from django.urls import path

from risk_management import views

urlpatterns = [
    path("get-questions-dict/<str:category>/", views.risk_management_questions, name="risk_management_questions"),
]
