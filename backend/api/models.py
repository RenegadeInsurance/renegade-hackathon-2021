from django.db import models
from django.core.validators import RegexValidator
# from django.contrib.auth.models import User
# Create your models here.

class Personal(models.Model):
    first_name=models.CharField(max_length=50,blank=False)
    midddle_name = models.CharField(max_length=50,null=True)
    last_name=models.CharField(max_length=50,blank=False)
    email=models.EmailField(unique=True, blank=False)
    age = models.IntegerField(blank=False)
    phone_regex = RegexValidator(regex=r'^\+?1?\d{9,15}$', message="Phone number must be entered in +977 format.")
    phone_number = models.CharField(validators=[phone_regex], max_length=17, blank=True)
    
    country=models.CharField(max_length=50,blank=False)
    state=models.CharField(max_length=50,blank=False)
    city=models.CharField(max_length=50,blank=False)


    class Meta:
        verbose_name_plural = "user"


# class Location(models.Model):
#     city = models.CharField(max_length=25)
#     state = models.CharField(max_length=25)
#     country = models.CharField(max_length=25)

#     def __str__(self):
#         return f"{self.city} in {self.country}"

#     class Meta:
#         verbose_name_plural = "location"

# class Connection(models.Model):
#     user = models.ForeignKey(User, on_delete=models.CASCADE)
#     name = models.CharField(max_length=25)
#     relationship = models.CharField(max_length=25)
#     email = models.EmailField(unique=True)
#     phone_regex = RegexValidator(regex=r'^\+?1?\d{9,15}$', message="Phone number must be entered in +977 format.")
#     phone_number = models.CharField(validators=[phone_regex], max_length=17, blank=True)

#     def __str__(self):
#         return f"{self.user}'s {self.relationship}"

#     class Meta:
#         verbose_name_plural = "connection"

