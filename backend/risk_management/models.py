import json
import pathlib

from django.db import models
from django.utils.translation import gettext_lazy as _
from django.conf import settings

from common.models import BaseModel


class RiskManagementQuestion(BaseModel):
    """
    Stores the questions related to Risk Management.
    """
    category = models.CharField(
        verbose_name=_("Category"),
        help_text=_("Category of questions dict"),
        max_length=128,
        blank=False,
    )
    # This will store data in a tree format,
    # where each new dictionary branches from the given question, until the final question is reached.
    questions = models.JSONField(
        verbose_name=_("Questions"),
        help_text=_("Question JSON data")
    )

    @classmethod
    def load_questions_from_json(cls) -> list["RiskManagementQuestion"]:
        """
        Loads data from question bank, and populates the database.
        This is used for making it easier to update database with new questions.

        :return: List of newly created objects of `RiskManagementQuestion`.
        """
        with open(str(pathlib.Path(settings.BASE_DIR, "risk_management", "data", "questions.json")), "r") as f:
            questions_dict = json.load(f)
            questions_objects = []

            for questions in questions_dict:
                questions_objects.append(cls(questions=questions["data"], category=questions["category"]))

            return cls.objects.bulk_create(questions_objects)

    def __str__(self) -> str:
        return self.category
