from rest_framework.viewsets import ModelViewSet
from rest_framework.permissions import IsAuthenticated
from .serializers import AlertPersonnelSerializer
from .models import AlertPersonnel

class AlertPersonnelViewset(ModelViewSet):
    serializer_class = AlertPersonnelSerializer
    permission_classes = [IsAuthenticated]

    def get_queryset(self):
        user = self.request.user
        alert_personnels =AlertPersonnel.objects.filter(user=user)
        return alert_personnels
    
    def perform_create(self, serializer):
        serializer.save(user=self.request.user)