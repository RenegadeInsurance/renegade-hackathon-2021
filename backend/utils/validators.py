import phonenumbers
from django.core.exceptions import ValidationError
from django.utils.translation import gettext_lazy as _


def validate_phone(number: str) -> None:
    """
    Validates given phone number, If invalid then raise django.core.exceptions.ValidationError

    :param number: Phone Number in any format
    :return: None
    """
    try:
        _number = phonenumbers.parse(number, "NP")
        if not phonenumbers.is_valid_number(_number):
            raise ValidationError(
                _(f"`{number}` is not a Valid Number."),
            )
    except Exception as e:
        raise ValidationError(
            _(f"`{number}` is not a Valid Number."),
        )


def validate_name(name: str) -> None:
    """
    Validates the given name, If invalid then raise django.core.exceptions.ValidationError
    :param name: Name to validate
    :return: None
    """

    name = name.replace(" ", "")
    if not name.isalpha():
        raise ValidationError(
            _(f"`{name}` is not a valid name, Numbers can only contain Alphabets.")
        )
