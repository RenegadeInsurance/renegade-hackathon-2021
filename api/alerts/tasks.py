from celery.utils.log import get_task_logger
from api.celery import app
import requests
from twilio.rest import TwilioRestClient
from .models import User

logger = get_task_logger(__name__)

city = 'Kathmandu'
api_key = '57390f3e72838c9e211d91d6960de1fc'
api_url = f'api.openweathermap.org/data/2.5/weather?q={city}&appid={api_key}'
threshold_temp = 10

account_sid = "AC94f776fa95125f3f31d700c5259022d3"
auth_token  = "b40f3930ddc64f80cf8e38db0caee447"
client = TwilioRestClient(account_sid, auth_token)
from_ = '+17479996319'

@app.task
def send_alert():
    users = User.objects.all()
    for user in users:
        logger.info('API Checked')
        city = user.city
        res = requests.get(f'http://api.openweathermap.org/data/2.5/weather?q={city}&appid=57390f3e72838c9e211d91d6960de1fc&units=metric')
        data = res.json()
        if data['main']['temp'] < threshold_temp:
            message = client.messages.create(
                body="Alert! You may be in danger. Please stay safe :-)",
                to=user.phone,
                from_=from_)

