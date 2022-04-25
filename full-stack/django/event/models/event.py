from datetime import datetime
from django.db import models

class Event(models.Model):
    start_date = models.DateTimeField(default=datetime.now())
    location = models.CharField(max_length=200)
    name = models.CharField(max_length=100)
    # description = models.TextField()
    # end_date = models.DateTimeField()
    # price = models.DecimalField(max_digits=6, decimal_places=2)
    # image = models.ImageField(upload_to='events')

    def __str__(self):
        return self.name

