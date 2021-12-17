from rest_framework.serializers import ModelSerializer

from location_manager.models import LocationData


class LocationDataSerializer(ModelSerializer):
    class Meta:
        model = LocationData
        fields = ["country", "province", "location_data"]
