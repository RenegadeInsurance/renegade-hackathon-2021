from django.utils.translation import gettext_lazy as _

from rest_framework import serializers


class WeatherApiParameterSerializer(serializers.Serializer):
    """
    Serializer to accept and validate data from GET parameters of request.
    """
    location = serializers.CharField(
        max_length=256,
        help_text=_("Searches for given location in this field."),
    )
    alerts = serializers.BooleanField(
        default=False, required=False,
        help_text=_("If set `True`, includes weather alerts in response."),
    )
    days = serializers.IntegerField(
        default=None, required=False, min_value=1, max_value=5,
        help_text=_("Includes Weather Forecast for given number of days in response.")
    )
    aqi = serializers.BooleanField(
        default=False, required=False,
        help_text=_("If set `True`, includes air quality index in response."),
    )

    def update(self, instance, validated_data) -> None:
        """Abstract Method Implementation"""
        pass

    def create(self, validated_data) -> None:
        """Abstract Method Implementation"""
        pass
