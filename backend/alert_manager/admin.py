from django.contrib import admin

from alert_manager import models


@admin.register(models.AlertPersonnel)
class AlertPersonnelAdmin(admin.ModelAdmin):
    pass


@admin.register(models.UserDetails)
class UserDetailsAdmin(admin.ModelAdmin):
    pass
