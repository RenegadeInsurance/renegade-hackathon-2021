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

    return render('')

