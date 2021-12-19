from django.urls import path
from .views import Home,UserAssesment

urlpatterns = [
    path('/',Home,name='home'),
    path('/assessment/',UserAssesment,name='assessment')


]