from rest_framework import serializers

from risk_management.models import RiskManagementQuestion


class RiskManagementQuestionSerializer(serializers.ModelSerializer):
    """
    Serializes the fields of RiskManagementQuestion Model/Table.
    """

    class Meta:
        model = RiskManagementQuestion
        fields = ["category", "questions"]  # Fields to be included in output.
