from django.db import models
from django.utils.translation import gettext_lazy as _

from common.models import BaseModel
from utils.validators import validate_name, validate_phone


class UserDetails(BaseModel):
    # CHOICES FOR FIELDS INSIDE MODEL !!
    GENDER_CHOICES = [
        ("M", "Male"),
        ("F", "Female"),
    ]
    COUNTRY_CHOICES = [
        ("NP", "Nepal"),
        ("IN", "India"),
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
        help_text=_("Name of the country"),
        max_length=128,
    )
