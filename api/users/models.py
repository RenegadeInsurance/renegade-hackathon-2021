from django.db import models
from django.contrib.auth.models import AbstractUser, BaseUserManager

class CustomUserManager(BaseUserManager):

    def create_user(self, email, password, **extra_fields):
        if not email:
            raise ValueError('The email must be set')
        if not password:
            raise ValueError('The password must be set')

        email = self.normalize_email(email)
        user = self.model(email=email, **extra_fields)
        user.set_password(password)
        user.save()
        return user

    def create_superuser(self, email, password, **extra_fields):
        extra_fields.setdefault('is_staff', True)
        extra_fields.setdefault('is_superuser', True)
        extra_fields.setdefault('is_active', True)

        if extra_fields.get('is_staff') is not True:
            raise ValueError('Superuser must have is_staff=True.')
        if extra_fields.get('is_superuser') is not True:
            raise ValueError('Superuser must have is_superuser=True.')
        
        return self.create_user(email, password, **extra_fields)

class User(AbstractUser):
    username = None
    first_name = models.CharField(max_length=50)
    last_name = models.CharField(max_length=50)
    email = models.EmailField(unique=True)
    province = models.CharField(max_length=50)
    city = models.CharField(max_length=50)
    phone = models.CharField(max_length=15)
    score = models.DecimalField(default=15, decimal_places=2, max_digits=5)
    has_completed = models.BooleanField(default=False)
    
    objects = CustomUserManager()

    USERNAME_FIELD = 'email'
    REQUIRED_FIELDS = ['first_name', 'last_name', 'phone', 'province', 'city']

    class Meta:
        ordering = ['-date_joined']

    def __str__(self):
        return f'{self.id} {self.first_name} {self.last_name}'

class AlertPersonnel(models.Model):
    name = models.CharField(max_length=50)
    relationship = models.CharField(max_length=20)
    email = models.EmailField()
    phone = models.CharField(max_length=15)
    user = models.ForeignKey(User, related_name='alert_personnels', on_delete=models.CASCADE)