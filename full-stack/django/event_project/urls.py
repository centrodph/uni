"""event_project URL Configuration

The `urlpatterns` list routes URLs to views. For more information please see:
    https://docs.djangoproject.com/en/4.0/topics/http/urls/
Examples:
Function views
    1. Add an import:  from my_app import views
    2. Add a URL to urlpatterns:  path('', views.home, name='home')
Class-based views
    1. Add an import:  from other_app.views import Home
    2. Add a URL to urlpatterns:  path('', Home.as_view(), name='home')
Including another URLconf
    1. Import the include() function: from django.urls import include, path
    2. Add a URL to urlpatterns:  path('blog/', include('blog.urls'))
"""
from django.contrib import admin
from django.urls import path, include, re_path
from rest_framework import routers
from django.views.static import serve
from drf_yasg.views import get_schema_view
from drf_yasg import openapi

from . import settings
from attendee.urls import router as attendee_router
from event.urls import router as event_router

router = routers.DefaultRouter()
router.registry.extend(attendee_router.registry)
router.registry.extend(event_router.registry)

schema_view = get_schema_view(
    openapi.Info(
        title="Full stack Django Event API",
        default_version='v1',
        description="API for the Full stack Django Event",
        contact=openapi.Contact(email="centrodph@gmail.com"),
    ),
    public=True,
)


static_urlpatterns = [
    re_path(r"static/(?P<path>.*)$", serve, {"document_root": "static"}),
]

urlpatterns = [
    path('admin/', admin.site.urls),
    path('api/', include(router.urls)),
    path('doc/', schema_view.with_ui('swagger', cache_timeout=0), name='schema-swagger-ui'),
]
