from rest_framework import serializers

from event.models.event import Event
from attendee.serializer import AttendeeSerializer

class EventSerializer(serializers.ModelSerializer):
    attendees = AttendeeSerializer(many=True)
    class Meta:
        model = Event
        fields = '__all__'
