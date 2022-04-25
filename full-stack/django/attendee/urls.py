from django.db import router
from rest_framework import routers
from attendee.views import AttendeeViewSet

router = routers.DefaultRouter()
router.register(r'attendees', AttendeeViewSet, 'attendees')