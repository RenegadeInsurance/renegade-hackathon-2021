from django.urls import path
from .views import LoginPage,RegisterUser

urlpatterns = [
    path('',LoginPage,name='login'),
    path('register/',RegisterUser,name='register')


]