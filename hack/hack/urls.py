
from django.contrib import admin
from django.urls import path
from hackathon.views.views import *
from hackathon.views.faq import *
from hackathon.views.location import *
from hackathon.views.user import *
import hackathon

urlpatterns = [
    # path('admin/', admin.site.urls),
    path('', getRoutes),
    path('user/', getUsers),
    # path('user/<str:pk>/', getUsers),
    path('user/insert/', insertUser),
    path('user/update/', updateUser),
    path('location/', getLocations),
    path('location/insert/', insertLocation),
    path('location/update/', updateLocation),
    path('faq/', getFAQs),
    path('faq/insert/', insertFAQ),
    path('faq/update/', updateFAQ),
]
