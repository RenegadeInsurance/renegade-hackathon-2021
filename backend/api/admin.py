from django.contrib import admin
from .models import *

# Register your models here.
admin.site.register(User)
admin.site.register(Location)
admin.site.register(Connection)
admin.site.register(Attribute)
admin.site.register(Form)

