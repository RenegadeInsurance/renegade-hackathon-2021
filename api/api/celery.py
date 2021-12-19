import os
from celery import Celery
from celery.schedules import crontab

os.environ.setdefault('DJANGO_SETTINGS_MODULE', 'api.settings')
app = Celery('zpi')
app.config_from_object('django.conf:settings', namespace='CELERY')
app.autodiscover_tasks()
app.conf.beat_schedule = {
'send-alert': {
    'task': 'alerts.tasks.send_alert',
    'schedule': 3600
  },
}