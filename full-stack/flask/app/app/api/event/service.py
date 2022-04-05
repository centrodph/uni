import datetime
from app.models.schemas import EventSchema
from app.models.event import Event

class EventService:
    @staticmethod
    def get_events():
        query = Event.query.all()
        data = EventSchema(many=True).dump(query)
        return data

    @staticmethod
    def get_all_events_by_range(starts_at: datetime, ends_at: datetime):
        from_date = starts_at.date()
        from_time = starts_at.time()
        
        to_date = ends_at.date()
        to_time = ends_at.time()
        
        query = Event.query.all()
        print(query)
