from rest_framework.serializers import ModelSerializer

from location_manager.models import LocationData


class LocationDataSerializer(ModelSerializer):
    """
    Serializes the fields of LocationData Model/Table.
    """

    class Meta:
        model = LocationData
        fields = ["country", "province", "location_data"]  # Fields to be included in output.
