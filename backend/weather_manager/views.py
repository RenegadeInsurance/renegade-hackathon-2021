from rest_framework import status
from rest_framework.decorators import api_view
from rest_framework.response import Response

from weather_manager.serializers import WeatherApiParameterSerializer
from weather_manager.weather_api import WeatherAPI


@api_view(["GET"])
def get_weather_data(request):
    # TODO: REMOVE HARDCODED API KEY !!
    weather_api = WeatherAPI("0e9591f33b6e43bfbd795528211712")
    params = WeatherApiParameterSerializer(data=request.GET)

    if params.is_valid():
        print(params.validated_data)
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
