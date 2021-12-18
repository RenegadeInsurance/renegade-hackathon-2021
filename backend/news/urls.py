from django.urls import path

from news import views

urlpatterns = [
    path("get-news/", views.get_news, name="get_news"),
]
