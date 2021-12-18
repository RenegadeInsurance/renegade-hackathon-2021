from django.urls import path, include
from .views import PersonalModelViewSet
from rest_framework.routers import DefaultRouter
# from django.views.generic import TemplateView

# creating Router Object
router = DefaultRouter()

# Register viewset with Router
router.register('personal', TechUserModelViewSet, basename= 'personal')

urlpatterns =[
	path('',include(router.urls))
]

