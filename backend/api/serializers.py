from rest_framework import serializers
from .models import *

class PersonalSerializer(serializers.ModelSerializer):
    class Meta:
        model = Personal()
        fields ='__all__'
