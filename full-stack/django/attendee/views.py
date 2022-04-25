from rest_framework import viewsets

from attendee.models import Attendee
from attendee.serializer import AttendeeSerializer

class AttendeeViewSet(viewsets.ModelViewSet):
    """Attendee resource"""
    queryset = Attendee.objects.all()
    serializer_class = AttendeeSerializer
