from django.forms import ModelForm
from .models import AssessmentModel
class AssessmentModalForm(ModelForm):
    class Meta:
        model=AssessmentModel
        fields=['Experienced_flood','Muncipality_emergency_system','Ready_to_face','Flood_risk_at_your_area','Near_river']
