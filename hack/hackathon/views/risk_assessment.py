from django.http import JsonResponse, HttpRequest
from numpy.core import records
from ..models import Category
import mysql.connector
import pandas as pd
from rest_framework.response import *
from rest_framework.decorators import api_view
import json

@api_view(['GET'])
def getRiskAssessments(request):
    # request_json = request.data
    if 1==1:
        # ASMID = request_json['ASMID']
        cnx = mysql.connector.connect(user = 'root', password = '', host = 'localhost', database = 'hackathon')
        cursor = cnx.cursor()
        query = ("SELECT * FROM RiskAssessment;")
        cursor.execute(query)
        df = pd.DataFrame(cursor.fetchall(),columns=["riskAssessmentID", "title", "remarks"]).to_json(orient="records")
        return Response(json.loads(df))
    return Response("False")


@api_view(['POST'])
def insertRiskAssessment(request): 
    request_json = request.data
    cnx = mysql.connector.connect(user = 'root', password = '', host = 'localhost', database = 'hackathon')
    cursor = cnx.cursor()
    if request_json:
        myKeys = list(request_json.keys())
        query1 = "INSERT INTO RiskAssessment("
        for i in myKeys:
          query1 += i + ", "
        query1 = query1[0:len(query1)-2] + ") VALUES ("
        for i in myKeys:
          if(i=="title" or i=="remarks"):
            query1 += '"'
          query1 += str(request_json[i])
          if(i=="title" or i=="remarks"):
            query1 += '"'
          query1 += ","           
        query1 = (query1[0:len(query1)-1] + ");")
        cursor.execute(query1)
        cnx.commit()
        return Response("True")
    else:
        return Response("False")

@api_view(['PUT'])
def updateRiskAssessment(request): 
    request_json = request.data
    cnx = mysql.connector.connect(user = 'root', password = '', host = 'localhost', database = 'hackathon')
    cursor = cnx.cursor()
    if request_json:
        myKeys = list(request_json.keys())
        riskAssessmentID = request_json["riskAssessmentID"]
        myKeys.remove("riskAssessmentID")
        query1 = "UPDATE Location SET "
        for i in myKeys:
          query1 += i
          query1 += "="
          if(i=="title" or i=="remarks"):
            query1 += '"'
          query1 += str(request_json[i])
          if(i=="title" or i=="remarks"):
            query1 += '"'
          query1 += ","           
        query = (query1[0:len(query1)-1] + " WHERE riskAssessmentID = " + riskAssessmentID + ";")
        cursor.execute(query)
        cnx.commit()
        return Response("True")
    else:
        return Response("False")