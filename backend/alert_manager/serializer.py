from rest_framework import serializers

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
