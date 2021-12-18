import requests
from dotenv import dotenv_values

from rest_framework import status
from rest_framework.decorators import api_view
from rest_framework.request import Request
from rest_framework.response import Response

from weather_manager.serializers import WeatherApiParameterSerializer
from weather_manager.weather_api import WeatherAPI


@api_view(["GET"])
def get_weather_data(request: Request) -> Response:
    """
    Gets current weather data or forecast for given number of days, depending on the GET parameters.

    AVAILABLE PARAMETERS:
     - location
     - alerts
     - days
     - aqi
     - coordinates

    :param request: ...
    :return: Current weather or forecast for given number of days
    """
    # TODO: REMOVE HARDCODED API KEY !!
    weather_api = WeatherAPI(
        {"weatherapi": "0e9591f33b6e43bfbd795528211712"}
    )
    params = WeatherApiParameterSerializer(data=request.GET)

    if params.is_valid():
        try:
            if params.validated_data.get("location") is None:
                raise ValueError("Location is required")

            return Response(
                weather_api.get_weather_for_location(
                    params.validated_data.get("location"),
                    get_air_quality_index=params.validated_data.get("aqi"),
                    get_alerts=params.validated_data.get("alerts"),
                    days=params.validated_data.get("days")
                ),
                status=status.HTTP_200_OK
            )

        except Exception as e:
            return Response(
                {"error": True, "message": str(e)},
                status=status.HTTP_404_NOT_FOUND
            )
    else:
        return Response(
            params.errors,
            status=status.HTTP_403_FORBIDDEN
        )


@api_view(["GET"])
def get_location_from_geo_location(request):
    coordinates = request.GET.get("coordinates")
    print(dotenv_values().get("weather_api_key"))
    return Response(
        requests.get(
            "https://maps.googleapis.com/maps/api/geocode/json",
            params={
                "latlng": coordinates,
                "sensor": "true",
                "key": dotenv_values().get("weather_api_key")
            }
        ).json()
    )
