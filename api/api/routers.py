from rest_framework import routers

from accounts.views import UserViewSet
from medical.views import VitalViewSet


router = routers.SimpleRouter()
router.register(r'users', UserViewSet)
router.register(r'medical/vitals', VitalViewSet)
