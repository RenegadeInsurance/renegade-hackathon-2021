from django.http import JsonResponse, HttpRequest
from numpy.core import records
from ..models import Category
import mysql.connector
import pandas as pd
from rest_framework.response import *
from rest_framework.decorators import api_view
import json

@api_view(['GET'])
def getFAQs(request):
    # request_json = request.data
    if 1==1:
        # ASMID = request_json['ASMID']
        cnx = mysql.connector.connect(user = 'root', password = '', host = 'localhost', database = 'hackathon')
        cursor = cnx.cursor()
        query = ("SELECT * FROM FAQ;")
        cursor.execute(query)
        df = pd.DataFrame(cursor.fetchall(),columns=["faqID", "question", "yesNode", "noNode", "isStart"]).to_json(orient="records")
        return Response(json.loads(df))
    return Response("False")


@api_view(['POST'])
def insertFAQ(request): 
    request_json = request.data
    cnx = mysql.connector.connect(user = 'root', password = '', host = 'localhost', database = 'hackathon')
    cursor = cnx.cursor()
    if request_json:
        myKeys = list(request_json.keys())
        query1 = "INSERT INTO FAQ("
        for i in myKeys:
          query1 += i + ", "
        query1 = query1[0:len(query1)-2] + ") VALUES ("
        for i in myKeys:
          if(i=="question"):
            query1 += '"'
          query1 += str(request_json[i])
          if(i=="question"):
            query1 += '"'
          query1 += ","           
        query1 = (query1[0:len(query1)-1] + ");")
        cursor.execute(query1)
        cnx.commit()
        return Response("True")
    else:
        return Response(str(type(request_json)))

@api_view(['PUT'])
def updateFAQ(request): 
    request_json = request.data
    cnx = mysql.connector.connect(user = 'root', password = '', host = 'localhost', database = 'hackathon')
    cursor = cnx.cursor()
    if request_json:
        myKeys = list(request_json.keys())
        faqID = request_json["faqID"]
        myKeys.remove("locationID")
        query1 = "UPDATE Location SET "
        for i in myKeys:
          query1 += i
          query1 += "="
          if(i=="question"):
            query1 += '"'
          query1 += str(request_json[i])
          if(i=="question"):
            query1 += '"'
          query1 += ","           
        query = (query1[0:len(query1)-1] + " WHERE faqID = " + faqID + ";")
        cursor.execute(query)
        cnx.commit()
        return Response("True")
    else:
        return Response("False")