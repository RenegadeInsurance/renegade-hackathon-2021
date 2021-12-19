from django.contrib import admin
from .models import PersonalModel

# Register your models here.
# admin.site.register(Personal)

@admin.register(PersonalModel)
class PersonalAdmin(admin.ModelAdmin):
    list_display = ['first_name', 'middle_name', 'last_name', 'email', 'age', 'phone_number', 'country','state', 'city' ]