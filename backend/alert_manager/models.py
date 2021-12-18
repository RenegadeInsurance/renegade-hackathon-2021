from django.db import models
from django.utils.translation import gettext_lazy as _

from common.models import BaseModel
from utils.validators import validate_name, validate_phone


class RiskAssessment(BaseModel):
    RISK_AMOUNT_CHOICES = [
        ("High", "high"),
        ("Moderate", "Moderate"),
    ]

    category = models.CharField(
        verbose_name=_("Category"),
        help_text=_("Category of risk"),
        max_length=64,
    )
    risk_amount = models.CharField(
        verbose_name=_("Risk Amount"),
        help_text=_("Severeness of risk"),
        max_length=32,
        choices=RISK_AMOUNT_CHOICES,
    )

    def __str__(self):
        return self.category


class AlertPersonnel(BaseModel):
    name = models.CharField(
        verbose_name=_("Name"),
        help_text=_("Name of the user."),
        max_length=256,
        validators=[validate_name],
    )
    email = models.EmailField(
        verbose_name=_("Email"),
        help_text=_("Email of the user."),
    )
    phone_number = models.CharField(
        verbose_name=_("Phone Number"),
        help_text=_("Phone Number to send notification on."),
        validators=[validate_phone],
        max_length=32,
    )
    relationship = models.CharField(
        verbose_name=_("Relationship"),
        help_text=_("Relationship to the person."),
        max_length=128,
    )

    #
    # relative = models.ForeignKey(
    #     verbose_name=_("Relative"),
    #     help_text=_("Relative of the people"),
    #     to=UserDetails,
    #     on_delete=models.CASCADE,
    #     blank=True,
    #     null=True,
    #     default=None
    # )

    def __str__(self):
        return self.name


class UserDetails(BaseModel):
    # CHOICES FOR FIELDS INSIDE MODEL !!
    GENDER_CHOICES = [
        ("Male", "Male"),
        ("Female", "Female"),
    ]
    COUNTRY_CHOICES = [
        ("Nepal", "Nepal"),
        ("Nepal", "India"),
    ]
    RISK_AMOUNT_CHOICES = [
        ("High", "high"),
        ("Moderate", "Moderate"),
    ]

    # PERSONAL DETAIL !!
    name = models.CharField(
        verbose_name=_("Name"),
        help_text=_("Name of the user."),
        max_length=256,
        validators=[validate_name],
    )
    email = models.EmailField(
        verbose_name=_("Email"),
        help_text=_("Email of the user."),
    )
    phone_number = models.CharField(
        verbose_name=_("Phone Number"),
        help_text=_("Phone Number to send notification on."),
        validators=[validate_phone],
        max_length=32,
    )
    date_of_birth = models.DateField(
        verbose_name=_("Date of Birth"),
        help_text=_("Birthdate of the user"),
    )
    biological_gender = models.CharField(
        verbose_name=_("Biological Gender"),
        help_text=_("Gender of the user, what was your gender at birth?"),
        max_length=32,
        choices=GENDER_CHOICES,
    )

    # LOCATION !!
    country = models.CharField(
        verbose_name=_("County"),
        help_text=_("Name of the country you live in"),
        max_length=128,
        choices=COUNTRY_CHOICES,
    )
    state = models.CharField(
        verbose_name=_("State"),
        help_text=_("Name of the state you live in"),
        max_length=256,
    )
    city = models.CharField(
        verbose_name=_("City"),
        help_text=_("Name of the city you live in"),
        max_length=256
    )

    # ... Risk Assessment !!
    # risks = models.ForeignKey(
    #     to=RiskAssessment,
    #     on_delete=models.CASCADE,
    #     verbose_name=_("Risks"),
    #     help_text=_("Keeps track of Severeness of risk in different category in users area.")
    # )
    category = models.CharField(
        verbose_name=_("Category"),
        help_text=_("Category of risk"),
        max_length=64,
    )
    risk_amount = models.CharField(
        verbose_name=_("Risk Amount"),
        help_text=_("Severeness of risk"),
        max_length=32,
        choices=RISK_AMOUNT_CHOICES,
    )
    relative = models.ManyToManyField(
        to=AlertPersonnel,
        verbose_name=_("Relatives"),
        help_text=_("Relatives of the user")
    )

    def __str__(self):
        return self.name
