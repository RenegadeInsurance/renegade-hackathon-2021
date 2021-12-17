import json
import pathlib

from django.conf import settings
from django.db import models
from django.utils.translation import gettext_lazy as _

from common.models import BaseModel


class LocationData(BaseModel):
    """
    Stores location data of available countries, their province and other required data.
    """
    country = models.CharField(
        verbose_name=_("Country"),
        help_text=_("Name of country"),
        max_length=128,
    )
    province = models.CharField(
        verbose_name=_("Province"),
        help_text=_("Name of province"),
        max_length=128,
    )
    # Stores district as key of dictionary and it's value contains, sub-locations within the district.
    location_data = models.JSONField(
        verbose_name=_("Location Data"),
        help_text=_("Location data in json format.")
    )

    @classmethod
    def scrape_and_load_province_data(cls) -> list["LocationData"]:
        """
        Scrapes data from web and saves data to the database.
        NOTE: For now it is using the pre-scraped data to populate the database.

        :return: List of newly created `LocationData` objects.
        """
        with open(str(pathlib.Path(settings.BASE_DIR, "location_manager", "data", "location.json")), "r") as f:
            location_data = json.load(f)
            location_objects = []

            for country in location_data:
                for province in location_data[country]:
                    location_objects.append(
                        cls(
                            country=country,
                            province=province,
                            location_data=location_data[country][province]
                        )
                    )

            return cls.objects.bulk_create(location_objects)

    def __str__(self) -> str:
        """
        :return: Str of country and province joined by ','.
        """
        return f"{self.country}, {self.province}"
