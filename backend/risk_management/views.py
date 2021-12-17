from rest_framework import status
from rest_framework.response import Response
from rest_framework.decorators import api_view

from risk_management.models import RiskManagementQuestion
from risk_management.serializers import RiskManagementQuestionSerializer


@api_view(["GET"])
def risk_management_questions(request, category):
    questions = RiskManagementQuestionSerializer(
        RiskManagementQuestion.objects.filter(category=category),
        many=True
    )

    if questions.data:
        return Response(
            questions.data,
            status=status.HTTP_200_OK
        )
    else:
        return Response(
            {"error": True, "message": f"`{category}` not found."},
            status=status.HTTP_404_NOT_FOUND
        )
