from django.urls import path
from .views import *

app_name = 'risk_assesment'
urlpatterns = [
    path('create', risk_assesment_create, name='risk_assesment_create'),
] 