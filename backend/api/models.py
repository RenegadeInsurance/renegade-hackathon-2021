from django.db import models
from django.core.validators import RegexValidator
from django.contrib.auth.models import User
# Create your models here.

class Attribute(models.Model):
    OPTIONS = (
        ('boolean', 'Boolean'),
        ('radio', 'Radio'),
        ('checkbox', 'Checkbox'),
        ('dropdown', 'Dropdown'),
        ('date', 'Date'),
        ('text', 'Text'),
        ('int', 'Integer'),
        ('decimal', 'Decimal'),
        ('file', 'File')
    )
    name = models.CharField(max_length=150)
    option_type = models.CharField(max_length=12, choices=OPTIONS)

    def __str__(self):
        return self.name
    
class Name(models.Model):
    name=models.CharField(max_length=20)
    def __str__(self):
        return self.name

class Form(models.Model):
    value = models.ForeignKey(Attribute, on_delete=models.CASCADE)
    name = models.ForeignKey(Name, on_delete=models.CASCADE)

    def __str__(self):
        return f"{self.value} {self.name}"


class User(models.Model):
    first_name=models.CharField(max_length=50,blank=False)
    last_name=models.CharField(max_length=50,blank=False)
    email=models.EmailField(unique=True)
    phone_regex = RegexValidator(regex=r'^\+?1?\d{9,15}$', message="Phone number must be entered in +977 format.")
    phone_number = models.CharField(validators=[phone_regex], max_length=17, blank=True)
    current_address=models.CharField(max_length=50,blank=True)
    permanent_address=models.CharField(max_length=50,blank=True)

    def __str__(self):
        return f"{self.first_name} {self.last_name}"

    class Meta:
        verbose_name_plural = "user"


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
        return f"{self.user}'s {self.relationship}"

    class Meta:
        verbose_name_plural = "connection"



