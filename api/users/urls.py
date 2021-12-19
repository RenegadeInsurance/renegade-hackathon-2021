from django.urls import path, include
from .views import AlertPersonnelViewset
from rest_framework.routers import DefaultRouter

router = DefaultRouter()
router.register('', AlertPersonnelViewset, basename='alert')

urlpatterns = router.urls
