from rest_framework import serializers

from .models import Attendee
# from event.serializer.event_serializer import EventSerializer


class AttendeeSerializer(serializers.ModelSerializer):
    # event = EventSerializer
    class Meta:
        model = Attendee
        fields = '__all__'

