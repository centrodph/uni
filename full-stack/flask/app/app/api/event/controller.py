from flask_restx import (
    Resource,
    reqparse,
    inputs,
)
from flask import (
    abort,
    jsonify,
)
from .service import EventService
from .dto import (
    api as event_api,
    event as event_dto,
    event_list as event_list_dto,
    error_response as error_response_dto,
)


@event_api.route('/')
class EventList(Resource):
    def get(self):
        """List all events"""
        events = EventService.get_events()
        return jsonify(event_list_dto.dump(events))
