from django.db import models
from django.utils.translation import gettext_lazy as _
from common.models import BaseModel


class News(BaseModel):
    title = models.CharField(
        verbose_name=_("Title"),
        help_text=_("Title of the news"),
        max_length=512,
    )
    news_content = models.TextField(
        verbose_name=_("News Content"),
        help_text=_("Main content of the news")
    )
    image_url = models.URLField(
        verbose_name=_("Image url"),
        help_text=_("Url of the image to load")
    )

    def __str__(self):
        return self.title
