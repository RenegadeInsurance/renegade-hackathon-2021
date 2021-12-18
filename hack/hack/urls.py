
from django.contrib import admin
from django.urls import path
from hackathon.views.views import *
from hackathon.views.faq import *
from hackathon.views.location import *
from hackathon.views.user_assessment import *
from hackathon.views.risk_assessment import *
from hackathon.views.user import *
from hackathon.views.personal_contact import *
from hackathon.views.personal_city import *
import hackathon

urlpatterns = [
    # path('admin/', admin.site.urls),
    path('', getRoutes),
    path('user/', getUsers),
    # path('user/<str:pk>/', getUsers),
    path('user/insert/', insertUser),
    path('user/update/', updateUser),
    path('user/signin/', userSignIn),
    path('location/', getLocations),
    path('location/insert/', insertLocation),
    path('location/update/', updateLocation),
    path('faq/', getFAQs),
    path('faq/insert/', insertFAQ),
    path('faq/update/', updateFAQ),
    path('userassessment/', getUserAssessments),
    path('userassessment/insert/', insertUserAssessment),
    path('userassessment/update/', updateUserAssessment),
    path('riskassessment/', getRiskAssessments),
    path('riskassessment/insert/', insertRiskAssessment),
    path('riskassessment/update/', updateRiskAssessment),
    path('personalcontact/', getPersonalContacts),
    path('personalcontact/insert/', insertPersonalContact),
    path('personalcontact/update/', updatePersonalContact),
    path('personalcity/', getPersonalCitys),
    path('personalcity/insert/', insertPersonalCity),
    path('personalcity/update/', updatePersonalCity),
    
]
