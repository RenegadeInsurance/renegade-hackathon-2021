from django.http import JsonResponse, HttpRequest
from numpy.core import records
from ..models import Category
import mysql.connector
import pandas as pd
from rest_framework.response import *
from rest_framework.decorators import api_view
import json

@api_view(['GET'])
def getLocations(request):
    # request_json = request.data
    if 1==1:
        # ASMID = request_json['ASMID']
        cnx = mysql.connector.connect(user = 'root', password = '', host = 'localhost', database = 'hackathon')
        cursor = cnx.cursor()
        query = ("SELECT * FROM Location;")
        cursor.execute(query)
        df = pd.DataFrame(cursor.fetchall(),columns=["locationID", "country", "state", "city",]).to_json(orient="records")
        return Response(json.loads(df))
    return Response("False")


@api_view(['POST'])
def insertLocation(request): 
    request_json = request.data
    cnx = mysql.connector.connect(user = 'root', password = '', host = 'localhost', database = 'hackathon')
    cursor = cnx.cursor()
    if request_json:
        myKeys = list(request_json.keys())
        query1 = "INSERT INTO Location("
        for i in myKeys:
          query1 += i + ", "
        query1 = query1[0:len(query1)-2] + ") VALUES ("
        for i in myKeys:
          if(i=="country" or i=="state" or i=="city"):
            query1 += '"'
          query1 += str(request_json[i])
          if(i=="country" or i=="state" or i=="city"):
            query1 += '"'
          query1 += ","           
        query1 = (query1[0:len(query1)-1] + ");")
        cursor.execute(query1)
        cnx.commit()
        query = ("SELECT MAX(locationID) FROM Location ;")
        cursor.execute(query)
        frame = pd.DataFrame(cursor.fetchall())
        return Response(str(frame[0][0]))
    else:
        return Response("False")

@api_view(['PUT'])
def updateLocation(request): 
    request_json = request.data
    cnx = mysql.connector.connect(user = 'root', password = '', host = 'localhost', database = 'hackathon')
    cursor = cnx.cursor()
    if request_json:
        myKeys = list(request_json.keys())
        locationID = request_json["locationID"]
        myKeys.remove("locationID")
        query1 = "UPDATE Location SET "
        for i in myKeys:
          query1 += i
          query1 += "="
          if(i=="country" or i=="state" or i=="city"):
            query1 += '"'
          query1 += str(request_json[i])
          if(i=="country" or i=="state" or i=="city"):
            query1 += '"'
          query1 += ","           
        query = (query1[0:len(query1)-1] + " WHERE locationID = " + locationID + ";")
        cursor.execute(query)
        cnx.commit()
        return Response("True")
    else:
        return Response("False")