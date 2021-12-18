from rest_framework import status
from rest_framework.response import Response
from rest_framework.decorators import api_view
from rest_framework.request import Request

from risk_management.models import RiskManagementQuestion
from risk_management.serializers import RiskManagementQuestionSerializer


@api_view(["GET"])
def risk_management_questions(request: Request, category: str) -> Response:
    """
    Gets all the risk management question for a given category

    :param request: Django's default request object
    :param category: Gets questions related to given category
    :return:
    """
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