from rest_framework import status
from rest_framework.decorators import api_view
from rest_framework.response import Response

from news import models
from news import serializers


@api_view(["GET"])
def get_news(request):
    news_list = serializers.NewsSerializer(models.News.objects.all(), many=True)

    return Response(
        news_list.data,
        status=status.HTTP_200_OK
    )
