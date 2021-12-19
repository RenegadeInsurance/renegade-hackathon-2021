from django.contrib.auth.models import User
from django.contrib.auth.forms import UserCreationForm
from django.forms import ModelForm
from .models import UserProfile
class UserForm(UserCreationForm):

    class Meta:
        model = User
        fields = ['first_name','last_name','email','username','password1','password2',]

class UserProfileForm(ModelForm):
    class Meta:
        model=UserProfile
        fields=['age','gender','country','state','city']

