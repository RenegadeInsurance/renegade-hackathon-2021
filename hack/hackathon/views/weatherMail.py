
from django.http import JsonResponse, HttpRequest
from numpy.core import records
import mysql.connector
import pandas as pd
from rest_framework.response import *
from rest_framework.decorators import api_view
import json
import configparser
import smtplib
from email.mime.multipart import MIMEMultipart
from email.mime.text import MIMEText
from datetime import date, datetime
import requests
import time

@api_view(['POST'])
def initiateThreshold(request):
    request_json = request.data
    if 1==1:
        threshold = request_json['threshold']
        userID = request_json['userID']
        latitude = request_json['latitude']
        longitude = request_json['longitude']

        cf = configparser.ConfigParser()
        cf.read('./config.ini')
        sec = 'email'

        # email = cf.get(sec, 'email')
        email = "sajat.shrestha@hilifefoodsnepal.com"
        # password = cf.get(sec, 'password')
        password = "qjrjyjxxsjywzjki"
        while True:
            cnx = mysql.connector.connect(user = 'root', password = '', host = 'localhost', database = 'hackathon')
            cursor = cnx.cursor()
            query = "SELECT * FROM PersonalContact WHERE userID = " + str(userID) + " and isSelected = " + "1" + ";"
            cursor.execute(query)
            df = pd.DataFrame(cursor.fetchall()).to_dict()
            recipient = []
            for i in df[4]:
                recipient.append(df[4][i])

            title = "FROM WEAS URGENT!!!"
            msg = MIMEMultipart()
            msg['Subject'] = 'WEAS ALERT'
            msg['From'] = email
            msg['To'] = ', '.join(recipient)

            url = 'https://api.tomorrow.io/v4/timelines?location='+ float(latitude) + ',' + float(longitude) + '&fields=temperature&timesteps=1h&units=metric&apikey=vFkMajlifNI8BxCnYo7fRec2TosC0iyZ'
            response = requests.request("GET", url)
            json_data = response.json()['data']['timelines'][0]['intervals']
            
            for i in range(len(json_data)):
                if(str(datetime.strptime(json_data[i]['startTime'], '20%y-%m-%dT%H:00:00Z'))[0:13] == str(datetime.now())[0:13] and float(json_data[i]['values']['temperature']) > float(threshold)):
                    result = "Current temperature is %s at the moment and has crossed the threshold. He is currently at latitude: %s longitude:%s" % (json_data[i]['values']['temperature'], latitude, longitude)
                    msgText = MIMEText('<b>%s</b><p>%s</p>' % (title, result), 'html')
                    msg.attach(msgText)

                    with smtplib.SMTP("smtp.gmail.com", "587") as smtpObj:
                        smtpObj.ehlo()
                        smtpObj.starttls()
                        smtpObj.login(email, password)
                        smtpObj.sendmail(email, recipient, msg.as_string(),)
            time.sleep(300)
