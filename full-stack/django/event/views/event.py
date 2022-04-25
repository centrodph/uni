from rest_framework import viewsets

from event.models.event import Event
from event.serializer.event_serializer  import EventSerializer

class EventViewSet(viewsets.ModelViewSet):
    """Event resource"""
    queryset = Event.objects.all()
    serializer_class = EventSerializer
