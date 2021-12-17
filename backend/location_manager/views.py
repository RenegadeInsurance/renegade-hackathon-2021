from rest_framework import status
from rest_framework.decorators import api_view
from rest_framework.response import Response
from rest_framework.request import Request

from location_manager.models import LocationData
from location_manager.serializer import LocationDataSerializer


@api_view(["GET"])
def location_list(request: Request) -> Response:
    """
    Returns all available location data.

    :param request:
    :return: all available location data
    """
    return Response(
        LocationDataSerializer(LocationData.objects.all(), many=True).data,
        status=status.HTTP_200_OK,
    )
