from tabnanny import verbose
from unicodedata import name
from django.db import models

from event.models.event import Event

# Create your models here.
class Attendee(models.Model):
    code = models.CharField(max_length=10, unique=True)
    first_name = models.CharField(max_length=100)
    last_name = models.CharField(max_length=100)
    gender = models.CharField(max_length=10, default='M')
    birth_date = models.DateField()

    event = models.ForeignKey(
        Event,
        related_name='attendees',
        on_delete=models.DO_NOTHING,
        null=True,
    )

    def __str__(self) -> str:
        return f"{self.first_name}, {self.last_name}"

    class Meta:
        verbose_name = 'Asistente'
        verbose_name_plural = 'Asistentes'    