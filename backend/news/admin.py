from django.contrib import admin

from news import models


@admin.register(models.News)
class NewsModelAdmin(admin.ModelAdmin):
    pass
