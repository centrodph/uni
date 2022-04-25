from django.db import router
from rest_framework import routers
from event.views.event import EventViewSet

router = routers.DefaultRouter()
router.register(r'events', EventViewSet, 'events')