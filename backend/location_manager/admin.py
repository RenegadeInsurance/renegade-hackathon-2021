from django.contrib import admin

from location_manager.models import LocationData


@admin.register(LocationData)
class LocationDataAdmin(admin.ModelAdmin):
    pass
