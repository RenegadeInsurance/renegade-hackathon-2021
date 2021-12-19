from django.shortcuts import render,redirect
import requests
from django.contrib.auth.models import User
from user.models import UserProfile
from .forms import AssessmentModalForm
from .models import AssessmentModel
import json

def Home(request):
    # user = UserProfile.objects.get(user=request.user.id)
    # if user:
    #   location_data=user.get_location()
    #      city=location_data['city']
    # #show current weather of the place
    # risk=AssessmentModel.objects.get(user=request.user.id)
    # risk=risk.get_risk()
    risk="high"
    city='Nepal'
    api="https://api.openweathermap.org/data/2.5/weather?q=~&units=metric&appid=a3a26cd0cd22bafaaa68a440ff6c8a68"
    api.replace('~',city)
    response = requests.get(api)
    text=json.dumps(response.json())
    print(text)
    content={
        'text':text,
        'risk':risk
    }

    return render(request,'home.html',content)

def UserAssesment(request):

    if request.method=="POST":
        form=AssessmentModalForm(request.POST)
        if form.is_valid():
            form.save()
            return redirect('home')
    form=AssessmentModalForm()
    template='user_assessment.html'
    content={ 'form':form}
    return  render(request,template,content)

def Compare(request,city):
    # user = UserProfile.objects.get(user=request.user.id)
    # if user:
    #   location_data=user.get_location()
    #      city=location_data['city']
    comparing_city=city
    current_city = 'Nepal'
    api = "https://api.openweathermap.org/data/2.5/weather?q=~&units=metric&appid=a3a26cd0cd22bafaaa68a440ff6c8a68"
    api1=api.replace('~',current_city)
    api2=api.replace('~',current_city)
    response1 = requests.get(api1)
    response2=request.get(api2)
    current_city_data = json.dumps(response1.json())
    comparing_city_data=json.dumps(response2.json())
    content = {
        'data1':current_city_data,
        'data2': comparing_city_data
    }

    return render(request, 'getweatherinfo.html', content)








