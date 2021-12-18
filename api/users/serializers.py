from rest_framework import serializers
from .models import User, AlertPersonnel

class AlertPersonnel(serializers.ModelSerializer):
    class Meta:
        model = AlertPersonnel
        fields = ['id', 'name', 'relationship', 'email', 'phone', 'user']

class UserSerializer(serializers.ModelSerializer):
    class Meta:
        model = User
        fields = ['id', 'first_name', 'last_name', 'email', 'province', 'city', 'phone', 'has_completed']
