from django.db import models
from django.core.validators import RegexValidator

# Create your models here.

class PersonalModel(models.Model):
    first_name = models.CharField(max_length=50, blank=False)
    middle_name = models.CharField(max_length=50,null=True)
    last_name=models.CharField(max_length=50,blank=False)
    email=models.EmailField(unique=True, blank=False)
    age = models.IntegerField(blank=False)
    phone_regex = RegexValidator(regex=r'^\+?1?\d{9,15}$', message="Phone number must be entered in +977 format.")
    phone_number = models.CharField(validators=[phone_regex], max_length=17, blank=True)
    
    country=models.CharField(max_length=50,blank=False)
    state=models.CharField(max_length=50,blank=False)
    city=models.CharField(max_length=50,blank=False)