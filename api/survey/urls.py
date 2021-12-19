from django.urls import path
from .views import QuestionView

urlpatterns = [
    path('question/', QuestionView.as_view(), name='question')
]