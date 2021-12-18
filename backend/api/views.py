from django.shortcuts import render
from .models import *
from .serializers import PersonalSerializer
from rest_framework import viewsets

# from django_filters.rest_framework import DjangoFilterBackend 


# Create your views here.  
class PersonalModelViewSet(viewsets.ModelViewSet):
    queryset = Personal.objects.all()
    serializer_class = PersonalSerializer
    # filter_backends = [DjangoFilterBackend]
    # filterset_fields = ['profession','location']