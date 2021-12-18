from rest_framework import status
from rest_framework.decorators import api_view
from rest_framework.response import Response
from rest_framework.request import Request

from alert_manager import models
from alert_manager import serializer


@api_view(["POST"])
def register_for_notification(request):
    user_detail_serializer = serializer.UserDetailsSerializer(data=request.data)

    if user_detail_serializer.is_valid():
        return Response(
            user_detail_serializer.data,
            status=status.HTTP_201_CREATED
        )
    else:
        return Response(
            user_detail_serializer.errors,
            status=status.HTTP_422_UNPROCESSABLE_ENTITY
        )
