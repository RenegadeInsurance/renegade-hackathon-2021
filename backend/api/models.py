from django.db import models
from django.core.validators import RegexValidator
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
    last_name=models.CharField(max_length=50,blank=False)
    email=models.EmailField(unique=True)
    phone_regex = RegexValidator(regex=r'^\+?1?\d{9,15}$', message="Phone number must be entered in +977 format.")
    phone_number = models.CharField(validators=[phone_regex], max_length=17, blank=True)
    address=models.CharField(max_length=50,blank=True)


class Location(models.Model):
    city = models.CharField(max_length=25)
    state = models.CharField(max_length=25)
    country = models.CharField(max_length=25)

    def __str__(self):
        return f"{self.city} in {self.country}"

    class Meta:
        verbose_name_plural = "location"

class Connection(models.Model):
    user = models.ForeignKey(User, on_delete=models.CASCADE)
    name = models.CharField(max_length=25)
    relationship = models.CharField(max_length=25)
    email = models.EmailField(unique=True)
    phone_regex = RegexValidator(regex=r'^\+?1?\d{9,15}$', message="Phone number must be entered in +977 format.")
    phone_number = models.CharField(validators=[phone_regex], max_length=17, blank=True)

    def __str__(self):
        return f"{self.User}'s {self.relationship}"

    class Meta:
        verbose_name_plural = "location"



