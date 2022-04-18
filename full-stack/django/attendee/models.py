from django.db import models

# Create your models here.
class Attendee(models.Model):
    first_name = models.CharField(max_length=100)
    last_name = models.CharField(max_length=100)
    gender = models.CharField(max_length=10, default='M')
    birth_date = models.DateField()