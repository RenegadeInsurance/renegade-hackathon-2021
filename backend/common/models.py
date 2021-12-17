from django.db import models
from django.utils.translation import gettext_lazy as _


class BaseModel(models.Model):
    """
    All of the models used in the project will inherit from this Abstract Model.
    It will be used for additional processing of data, providing additional methods, and decrease repetitions.
    """
    creation_datetime = models.DateTimeField(
        verbose_name=_("Creation Datetime"),
        help_text=_("Stores the time of Creation"),
        auto_now_add=True
    )
    update_datetime = models.DateTimeField(
        verbose_name=_("Update Datetime"),
        help_text=_("Stores the last time when updated"),
        auto_now=True
    )

    def is_creation(self) -> bool:
        """
        returns `True` if the object is being created !!

        :return: bool
        """
        return self._state.adding

    def is_update(self):
        """
        returns `True` if the object is being updated !!

        :return: bool
        """
        return not self.is_creation()

    class Meta:
        abstract = True  # Makes this model abstract so that it would not create any db tables.
