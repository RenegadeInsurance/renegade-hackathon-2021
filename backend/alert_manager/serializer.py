from rest_framework import serializers
from rest_framework.exceptions import ValidationError

from alert_manager import models


class RiskAssessmentSerializer(serializers.ModelSerializer):
    class Meta:
        model = models.RiskAssessment
        fields = ["category", "risk_amount"]


class AlertPersonnelSerializer(serializers.ModelSerializer):
    class Meta:
        model = models.AlertPersonnel
        fields = ["name", "email", "phone_number", "relationship"]


class UserDetailsSerializer(serializers.ModelSerializer):
    class Meta:
        model = models.UserDetails
        fields = [
            "name", "email", "phone_number", "date_of_birth",
            "biological_gender", "country", "state", "city",
            "risk_amount", "category", "relative"
        ]

    def validate_relative(self, value):  # NOQA
        if len(value) > 3:
            raise ValidationError("Only 3 members can be added.")
        return value


class MessageSerializer(serializers.ModelSerializer):
    class Meta:
        model = models.ToSendSMS
        fields = ["message", "sms_to_phone_number"]
