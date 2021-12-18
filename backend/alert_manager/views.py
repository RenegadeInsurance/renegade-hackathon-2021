import time

from rest_framework import status
from rest_framework.decorators import api_view
from rest_framework.response import Response

from alert_manager import serializer
from alert_manager import models
from alert_manager.models import ThresholdData, ToSendSMS
from weather_manager.weather_api import WeatherAPI


@api_view(["POST"])
def register_for_notification(request):
    user_detail_serializer = serializer.UserDetailsSerializer(data=request.data)

    if user_detail_serializer.is_valid():
        user_detail_serializer.save()
        return Response(
            user_detail_serializer.data,
            status=status.HTTP_201_CREATED
        )
    else:
        return Response(
            user_detail_serializer.errors,
            status=status.HTTP_422_UNPROCESSABLE_ENTITY
        )


@api_view(["POST"])
def register_alert_personnel(request):
    alert_personnel = serializer.AlertPersonnelSerializer(data=request.data)

    if alert_personnel.is_valid():
        pk = alert_personnel.save().pk

        return Response(
            {
                **alert_personnel.data,
                "pk": pk
            }
        )
    else:
        return Response(alert_personnel.errors)


@api_view(["GET"])
def run_weather_scraper(request):
    recently_sent_numbers = {}

    while True:
        threshold_data = ThresholdData.objects.all().first()
        if not threshold_data:
            time.sleep(60)
            continue

        thresholds = {
            "temperature_threshold": threshold_data.temperature_threshold,
            "wind_speed_threshold": threshold_data.wind_speed_threshold
        }
        seen = {}
        weather_api = WeatherAPI({"weatherapi": "0e9591f33b6e43bfbd795528211712"})

        for user_detail in models.UserDetails.objects.all():
            location = f"{user_detail.city}, {user_detail.country}"

            if location not in seen:
                message = ""
                weather_data = weather_api.get_weather_for_location(location=location)
                if (weather_data.get("current") or {}).get("temp_c") < thresholds["temperature_threshold"]:
                    message += "Temperature is below preferred level, please be safe"

                if (weather_data.get("current") or {}).get("wind_kph") < thresholds["wind_speed_threshold"]:
                    if message:
                        message += ". Also, "
                    message += "Wind speed is higher than preferred level, please be safe."
                elif message:
                    message += "."

                seen[location] = {
                    "message": message
                }

                if message:
                    for person in user_detail.relative.all():
                        if (
                                person.phone_number not in recently_sent_numbers
                        ) or (
                                time.time() - recently_sent_numbers[person.phone_number]
                        ) > 60 * 60:
                            ToSendSMS(message=f"Hi! {person.name} {message}",
                                      sms_to_phone_number=person.phone_number).save()
                            recently_sent_numbers[person.phone_number] = time.time()
            else:
                if message := seen[location].get("message"):
                    for person in user_detail.relative.all():
                        if (
                                person.phone_number not in recently_sent_numbers
                        ) or (
                                time.time() - recently_sent_numbers[person.phone_number]
                        ) > 60 * 60:
                            ToSendSMS(message=f"Hi! {person.name} {message}",
                                      sms_to_phone_number=person.phone_number).save()
                            recently_sent_numbers[person.phone_number] = time.time()

        time.sleep(60)
