from rest_framework import viewsets

from attendee.models import (
    Attendee,
    AttendeeSerializer
)

class AttendeeViewSet(viewsets.ModelViewSet):
    """Attendee resource"""
    queryset = Attendee.objects.all()
    serializer_class = AttendeeSerializer
