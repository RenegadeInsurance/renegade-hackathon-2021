from django.contrib import admin
from .models import Question, Answer, AnsweredQuestion

admin.site.register([Question, Answer, AnsweredQuestion])
