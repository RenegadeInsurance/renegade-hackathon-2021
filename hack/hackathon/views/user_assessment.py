from django.http import JsonResponse, HttpRequest
from numpy.core import records
from ..models import Category
import mysql.connector
import pandas as pd
from rest_framework.response import *
from rest_framework.decorators import api_view
import json

@api_view(['GET'])
def getUserAssessments(request):
    # request_json = request.data
    if 1==1:
        # ASMID = request_json['ASMID']
        cnx = mysql.connector.connect(user = 'root', password = '', host = 'localhost', database = 'hackathon')
        cursor = cnx.cursor()
        query = ("SELECT * FROM UserAssessment;")
        cursor.execute(query)
        df = pd.DataFrame(cursor.fetchall(),columns=["userAssessmentID", "userID", "riskAssessmentID", "isTaken", "riskFactor",]).to_json(orient="records")
        return Response(json.loads(df))
    return Response("False")


@api_view(['POST'])
def insertUserAssessment(request): 
    request_json = request.data
    cnx = mysql.connector.connect(user = 'root', password = '', host = 'localhost', database = 'hackathon')
    cursor = cnx.cursor()
    if request_json:
        myKeys = list(request_json.keys())
        query1 = "INSERT INTO UserAssessment("
        for i in myKeys:
          query1 += i + ", "
        query1 = query1[0:len(query1)-2] + ") VALUES ("
        for i in myKeys:
          query1 += str(request_json[i])
          query1 += ","           
        query1 = (query1[0:len(query1)-1] + ");")
        cursor.execute(query1)
        cnx.commit()
        return Response("True")
    else:
        return Response("False")

@api_view(['PUT'])
def updateUserAssessment(request): 
    request_json = request.data
    cnx = mysql.connector.connect(user = 'root', password = '', host = 'localhost', database = 'hackathon')
    cursor = cnx.cursor()
    if request_json:
        myKeys = list(request_json.keys())
        userAssessmentID = request_json["userAssessmentID"]
        myKeys.remove("userAssessmentID")
        query1 = "UPDATE UserAssessment SET "
        for i in myKeys:
          query1 += i
          query1 += "="
          query1 += str(request_json[i])
          query1 += ","           
        query = (query1[0:len(query1)-1] + " WHERE userAssessmentID = " + userAssessmentID + ";")
        cursor.execute(query)
        cnx.commit()
        return Response("True")
    else:
        return Response("False")