from pyexpat import model
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


parser = reqparse.RequestParser()
parser.add_argument(
    'starts_at',
    type=inputs.date_from_iso8601,
    required=True,
    help='returns events that start after the given date',
)
parser.add_argument(
    'ends_at',
    type=inputs.date_from_iso8601,
    required=True,
    help='returns events that end before the given date',
)


@event_api.route('/')
class EventList(Resource):

    @event_api.response(
        400,
        description='Bad request',
        model=error_response_dto,
        envelope='error'
    )
    @event_api.response(
        200,
        description='List of events',
        model=event_list_dto,
        envelope='data'
    )
    @event_api.response(
        500,
        description='Server error',
        model=event_list_dto,
        envelope='data'
    )
    @event_api.expect(parser)
    def get(self):
        """
        Returns a list of events
        """
        # args = parser.parse_args()
        # events = EventService.get_events(args.starts_at, args.ends_at)
        # return {'events': events}
        events = EventService.get_events()
        print(events)
        return jsonify({
            'data': {
                'events': []
            }
        })
