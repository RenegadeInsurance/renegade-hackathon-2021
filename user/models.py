from django.db import models
from django.contrib.auth.models import User


class UserProfile(models.Model):
    IS_MALE = (
        ('T', 'Male'),
        ('F', 'Female'),
    )
    user = models.OneToOneField(User,on_delete=models.CASCADE)
    age=models.IntegerField(null=True,blank=False)
    is_alert_personal=models.BooleanField(default=False,verbose_name='Alert Personal')
    gender=models.CharField(max_length=30,choices=IS_MALE,blank=False,null=True)
    country=models.CharField(max_length=30,verbose_name='Country',null=True,blank=False)
    state=models.CharField(max_length=30,verbose_name='State',null=True,blank=False)
    city=models.CharField(max_length=30,verbose_name='City',null=True,blank=False)

    def __str__(self):
        return f'{self.user.username} UserProfile'
    def get_location(self):
        return {
            'country':self.country,
            'state':self.state,
            'city':self.city
        }
