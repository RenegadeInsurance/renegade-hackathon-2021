from rest_framework import serializers

from risk_management.models import RiskManagementQuestion


class RiskManagementQuestionSerializer(serializers.ModelSerializer):
    class Meta:
        model = RiskManagementQuestion
        fields = ["category", "questions"]
