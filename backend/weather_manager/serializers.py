from rest_framework import serializers


class WeatherApiParameterSerializer(serializers.Serializer):
    """
    Serializer to accept and validate data from GET parameters of request.
    """
    location = serializers.CharField(max_length=256)
    alerts = serializers.BooleanField(default=False, required=False)
    days = serializers.IntegerField(default=None, required=False, min_value=1, max_value=5)
    aqi = serializers.BooleanField(default=False, required=False)

    def update(self, instance, validated_data):
        """Abstract Method Implementation"""
        pass

    def create(self, validated_data):
        """Abstract Method Implementation"""
        pass
