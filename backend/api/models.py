from django.db import models
from django.core.validators import RegexValidator
<<<<<<< HEAD
from django.contrib.auth.models import User
from django.db.models.fields.related import ForeignKey
# Create your models here.

class UserDetailsForm(models.Model):
    title = models.TextField()
    inputType = models.TextField()
    option = ForeignKey(option.id) 


class Location(models.Model):




#    title        input type        Foreign Key
     name           string
     age            int
     email           email
     country         option        ["us", "Nepal", "Germany"]
     country         option        ["us", "Nepal", "Germany"]


     class options:
         value = models.TextField()


class UserData:
    name = models.TextField()
    email = models.TextField()
    age = models.TextField()

class UserData:
    name = models.TextField()
    email = models.TextField()
    age = models.TextField()
    country = models.TextField()



class User(models.Model):
    first_name=models.CharField(max_length=50,blank=False)
=======

# Create your models here.

class PersonalModel(models.Model):
    first_name = models.CharField(max_length=50, blank=False)
    middle_name = models.CharField(max_length=50,null=True)
>>>>>>> 66a7caf837093e7035fe0ac7e1dbd9d8c5f602ef
    last_name=models.CharField(max_length=50,blank=False)
    email=models.EmailField(unique=True, blank=False)
    age = models.IntegerField(blank=False)
    phone_regex = RegexValidator(regex=r'^\+?1?\d{9,15}$', message="Phone number must be entered in +977 format.")
    phone_number = models.CharField(validators=[phone_regex], max_length=17, blank=True)
    gender =models.CharField(max_length=20, blank=False)
    
    country=models.CharField(max_length=50,blank=False)
    state=models.CharField(max_length=50,blank=False)
    city=models.CharField(max_length=50,blank=False)