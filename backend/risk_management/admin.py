from django.contrib import admin

from risk_management.models import RiskManagementQuestion


@admin.register(RiskManagementQuestion)
class RiskManagementQuestionAdmin(admin.ModelAdmin):
    """Admin Page builder for Risk Management Questions Model"""
    pass
