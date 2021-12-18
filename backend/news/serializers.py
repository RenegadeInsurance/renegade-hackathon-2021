from rest_framework import serializers

from news import models


class NewsSerializer(serializers.ModelSerializer):
    class Meta:
        model = models.News
        fields = ["title", "news_content", "image_url", "creation_datetime", "update_datetime"]
