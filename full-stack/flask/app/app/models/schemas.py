from app import ma

from app.models.event import Event


class EventSchema(ma.Schema):
    '''serialize and deserialize Event objects'''
    class Meta:
        model = Event
        fields = ('id', 'description', 'start_date', 'start_time', 'location')