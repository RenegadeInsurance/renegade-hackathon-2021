import configparser
import smtplib
from email.mime.multipart import MIMEMultipart
from email.mime.text import MIMEText
from datetime import date, datetime
import requests
# class EmailSender():
#     def __init__(self):
#         self.cf = configparser.ConfigParser()
#         self.cf.read('./config.ini')
#         self.sec = 'email'

#         self.email = self.cf.get(self.sec, 'email')
#         self.host = self.cf.get(self.sec, 'host')
#         self.port = self.cf.get(self.sec, 'port')
#         self.password = self.cf.get(self.sec, 'password')

def SendEmail(recipient):
        title = "FROM WSAE"
        msg = MIMEMultipart()
        msg['Subject'] = 'WEAS ALERT'
        msg['From'] = "sajat.shrestha@hilifefoodsnepal.com"
        msg['To'] = ', '.join(recipient)

        url = 'https://api.tomorrow.io/v4/timelines?location=27.726649,85.344555&fields=temperature&timesteps=1h&units=metric&apikey=vFkMajlifNI8BxCnYo7fRec2TosC0iyZ'
        response = requests.request("GET", url)
        json_data = response.json()['data']['timelines'][0]['intervals']
        
        for i in range(len(json_data)):
            if(str(datetime.strptime(json_data[i]['startTime'], '20%y-%m-%dT%H:00:00Z'))[0:13] == str(datetime.now())[0:13]):
                print(json_data[i]['values']['temperature']) 
                # result = "Current temperature is %s at the moment and has crossed the threshold" % (json_data[i]['temp']['value'])
                    
                # msgText = MIMEText('<b>%s</b><p>%s</p>' % (title, result), 'html')
                # msg.attach(msgText)

                # with smtplib.SMTP("smtp.gmail.com", "587") as smtpObj:
                #     smtpObj.ehlo()
                #     smtpObj.starttls()
                #     smtpObj.login("sajat.shrestha@hilifefoodsnepal.com", "decrypt3521")
                #     smtpObj.sendmail("sajat.shrestha@hilifefoodsnepal.com", recipient, msg.as_string(),)
                #     return "Success"

                # return "Failed"
#         #         break
# {'data': {'timelines': [{'timestep': '1h', 'startTime': '2021-12-18T22:00:00Z', 'endTime': '2021-12-23T10:00:00Z', 'intervals': [{'startTime': '2021-12-18T22:00:00Z', 'values': {'temperature': 6}}, {'startTime': '2021-12-18T23:00:00Z', 'values': {'temperature': 4.4}}, {'startTime': '2021-12-19T00:00:00Z', 'values': {'temperature': 3.66}}, {'startTime': '2021-12-19T01:00:00Z', 'values': {'temperature': 2.87}}, {'startTime': '2021-12-19T02:00:00Z', 'values': {'temperature': 3.65}}, {'startTime': '2021-12-19T03:00:00Z', 'values': {'temperature': 8.17}}, {'startTime': '2021-12-19T04:00:00Z', 'values': {'temperature': 10.18}}, {'startTime': '2021-12-19T05:00:00Z', 'values': {'temperature': 12.2}}, {'startTime': '2021-12-19T06:00:00Z', 'values': {'temperature': 13.27}}, {'startTime': '2021-12-19T07:00:00Z', 'values': {'temperature': 13.98}}, {'startTime': '2021-12-19T08:00:00Z', 'values': {'temperature': 14.05}}, {'startTime': '2021-12-19T09:00:00Z', 'values': {'temperature': 13.68}}, {'startTime': '2021-12-19T10:00:00Z', 'values': {'temperature': 12.82}}, {'startTime': '2021-12-19T11:00:00Z', 'values': {'temperature': 10.58}}, {'startTime': '2021-12-19T12:00:00Z', 'values': {'temperature': 9.51}}, {'startTime': '2021-12-19T13:00:00Z', 'values': {'temperature': 8.94}}, {'startTime': '2021-12-19T14:00:00Z', 'values': {'temperature': 8.24}}, {'startTime': '2021-12-19T15:00:00Z', 'values': {'temperature': 7.88}}, {'startTime': '2021-12-19T16:00:00Z', 'values': {'temperature': 6.94}}, {'startTime': '2021-12-19T17:00:00Z', 'values': {'temperature': 6.5}}, {'startTime': '2021-12-19T18:00:00Z', 'values': {'temperature': 6.62}}, {'startTime': '2021-12-19T19:00:00Z', 'values': {'temperature': 6.94}}, {'startTime': '2021-12-19T20:00:00Z', 'values': {'temperature': 7.55}}, {'startTime': '2021-12-19T21:00:00Z', 'values': {'temperature': 7.69}}, {'startTime': '2021-12-19T22:00:00Z', 'values': {'temperature': 7.73}}, {'startTime': '2021-12-19T23:00:00Z', 'values': {'temperature': 7.64}}, {'startTime': '2021-12-20T00:00:00Z', 'values': {'temperature': 6.8}}, {'startTime': '2021-12-20T01:00:00Z', 'values': {'temperature': 5.65}}, {'startTime': '2021-12-20T02:00:00Z', 'values': {'temperature': 6.26}}, {'startTime': '2021-12-20T03:00:00Z', 'values': {'temperature': 9.12}}, {'startTime': '2021-12-20T04:00:00Z', 'values': {'temperature': 11.41}}, {'startTime': '2021-12-20T05:00:00Z', 'values': {'temperature': 12.74}}, {'startTime': '2021-12-20T06:00:00Z', 'values': {'temperature': 13.79}}, {'startTime': '2021-12-20T07:00:00Z', 'values': {'temperature': 14.24}}, {'startTime': '2021-12-20T08:00:00Z', 'values': {'temperature': 14.12}}, {'startTime': '2021-12-20T09:00:00Z', 'values': {'temperature': 13.56}}, {'startTime': '2021-12-20T10:00:00Z', 'values': {'temperature': 12.34}}, {'startTime': '2021-12-20T11:00:00Z', 'values': {'temperature': 10}}, {'startTime': '2021-12-20T12:00:00Z', 'values': {'temperature': 9.86}}, {'startTime': '2021-12-20T13:00:00Z', 'values': {'temperature': 9.57}}, {'startTime': '2021-12-20T14:00:00Z', 'values': {'temperature': 9.46}}, {'startTime': '2021-12-20T15:00:00Z', 'values': {'temperature': 9.37}}, {'startTime': '2021-12-20T16:00:00Z', 'values': {'temperature': 9.14}}, {'startTime': '2021-12-20T17:00:00Z', 'values': {'temperature': 8.79}}, {'startTime': '2021-12-20T18:00:00Z', 'values': {'temperature': 8.4}}, {'startTime': '2021-12-20T19:00:00Z', 'values': {'temperature': 7.99}}, {'startTime': '2021-12-20T20:00:00Z', 'values': {'temperature': 7.62}}, {'startTime': '2021-12-20T21:00:00Z', 'values': {'temperature': 7.43}}, {'startTime': '2021-12-20T22:00:00Z', 'values': {'temperature': 7.45}}, {'startTime': '2021-12-20T23:00:00Z', 'values': {'temperature': 6.41}}, {'startTime': '2021-12-21T00:00:00Z', 'values': {'temperature': 4.74}}, {'startTime': '2021-12-21T01:00:00Z', 'values': {'temperature': 3.81}}, {'startTime': '2021-12-21T02:00:00Z', 'values': {'temperature': 4.67}}, {'startTime': '2021-12-21T03:00:00Z', 'values': {'temperature': 8.37}}, {'startTime': '2021-12-21T04:00:00Z', 'values': {'temperature': 11.66}}, {'startTime': '2021-12-21T05:00:00Z', 'values': {'temperature': 13.06}}, {'startTime': '2021-12-21T06:00:00Z', 'values': {'temperature': 13.75}}, {'startTime': '2021-12-21T07:00:00Z', 'values': {'temperature': 14.35}}, {'startTime': '2021-12-21T08:00:00Z', 'values': {'temperature': 14.48}}, {'startTime': '2021-12-21T09:00:00Z', 'values': {'temperature': 13.96}}, {'startTime': '2021-12-21T10:00:00Z', 'values': {'temperature': 12.96}}, {'startTime': '2021-12-21T11:00:00Z', 'values': {'temperature': 10.26}}, {'startTime': 
# '2021-12-21T12:00:00Z', 'values': {'temperature': 10.54}}, {'startTime': '2021-12-21T13:00:00Z', 'values': {'temperature': 9.99}}, {'startTime': '2021-12-21T14:00:00Z', 'values': {'temperature': 9.6}}, {'startTime': '2021-12-21T15:00:00Z', 'values': {'temperature': 9.41}}, {'startTime': '2021-12-21T16:00:00Z', 'values': {'temperature': 9.34}}, {'startTime': '2021-12-21T17:00:00Z', 'values': {'temperature': 8.72}}, {'startTime': '2021-12-21T18:00:00Z', 'values': {'temperature': 7.38}}, {'startTime': '2021-12-21T19:00:00Z', 'values': {'temperature': 6.46}}, {'startTime': '2021-12-21T20:00:00Z', 'values': {'temperature': 6.21}}, {'startTime': '2021-12-21T21:00:00Z', 'values': {'temperature': 6.02}}, {'startTime': '2021-12-21T22:00:00Z', 'values': {'temperature': 5.52}}, {'startTime': '2021-12-21T23:00:00Z', 'values': {'temperature': 4.99}}, {'startTime': '2021-12-22T00:00:00Z', 'values': {'temperature': 4.66}}, {'startTime': '2021-12-22T01:00:00Z', 'values': {'temperature': 4.31}}, {'startTime': '2021-12-22T02:00:00Z', 'values': {'temperature': 5.96}}, {'startTime': '2021-12-22T03:00:00Z', 'values': {'temperature': 9.91}}, {'startTime': '2021-12-22T04:00:00Z', 'values': {'temperature': 12.77}}, {'startTime': '2021-12-22T05:00:00Z', 'values': {'temperature': 14.37}}, {'startTime': '2021-12-22T06:00:00Z', 'values': {'temperature': 15.31}}, {'startTime': '2021-12-22T07:00:00Z', 'values': {'temperature': 15.68}}, {'startTime': '2021-12-22T08:00:00Z', 'values': {'temperature': 15.52}}, {'startTime': '2021-12-22T09:00:00Z', 'values': {'temperature': 15.08}}, {'startTime': '2021-12-22T10:00:00Z', 'values': {'temperature': 14.13}}, {'startTime': '2021-12-22T11:00:00Z', 'values': {'temperature': 11.03}}, {'startTime': '2021-12-22T12:00:00Z', 
# 'values': {'temperature': 7.85}}, {'startTime': '2021-12-22T13:00:00Z', 'values': {'temperature': 6.92}}, {'startTime': '2021-12-22T14:00:00Z', 'values': {'temperature': 6.59}}, {'startTime': '2021-12-22T15:00:00Z', 'values': {'temperature': 6.32}}, {'startTime': '2021-12-22T16:00:00Z', 'values': {'temperature': 6}}, {'startTime': '2021-12-22T17:00:00Z', 'values': {'temperature': 5.73}}, {'startTime': '2021-12-22T18:00:00Z', 'values': {'temperature': 5.47}}, {'startTime': '2021-12-22T19:00:00Z', 'values': {'temperature': 5.22}}, {'startTime': '2021-12-22T20:00:00Z', 'values': {'temperature': 5.14}}, {'startTime': '2021-12-22T21:00:00Z', 'values': {'temperature': 4.99}}, {'startTime': '2021-12-22T22:00:00Z', 'values': {'temperature': 4.83}}, {'startTime': '2021-12-22T23:00:00Z', 'values': {'temperature': 4.74}}, {'startTime': '2021-12-23T00:00:00Z', 'values': {'temperature': 4.74}}, {'startTime': '2021-12-23T01:00:00Z', 'values': {'temperature': 4.7}}, {'startTime': '2021-12-23T02:00:00Z', 'values': {'temperature': 6.88}}, {'startTime': '2021-12-23T03:00:00Z', 'values': {'temperature': 10.71}}, {'startTime': '2021-12-23T04:00:00Z', 'values': {'temperature': 12.95}}, {'startTime': '2021-12-23T05:00:00Z', 'values': {'temperature': 14.35}}, {'startTime': '2021-12-23T06:00:00Z', 'values': {'temperature': 15.25}}, {'startTime': '2021-12-23T07:00:00Z', 'values': {'temperature': 15.58}}, {'startTime': '2021-12-23T08:00:00Z', 'values': {'temperature': 15.55}}, {'startTime': '2021-12-23T09:00:00Z', 'values': {'temperature': 
# 15.25}}, {'startTime': '2021-12-23T10:00:00Z', 'values': {'temperature': 14.38}}]}]}}

SendEmail(["mastersajat@gmail.com", "webpk144@gmail.com"])
