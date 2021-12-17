import json
import pathlib

from django.db import models
from django.utils.translation import gettext_lazy as _
from django.conf import settings

from common.models import BaseModel


class RiskManagementQuestion(BaseModel):
    category = models.CharField(
        verbose_name=_("Category"),
        help_text=_("Category of questions dict"),
        max_length=128,
        blank=False,
    )
    questions = models.JSONField(
        verbose_name=_("Questions"),
        help_text=_("Question JSON data")
    )

    @classmethod
    def load_questions_from_json(cls):
        with open(str(pathlib.Path(settings.BASE_DIR, "risk_management", "data", "questions.json")), "r") as f:
            questions_dict = json.load(f)
            questions_objects = []

            for questions in questions_dict:
                questions_objects.append(cls(questions=questions["data"], category=questions["category"]))

            return cls.objects.bulk_create(questions_objects)

    def __str__(self):
        return self.category
