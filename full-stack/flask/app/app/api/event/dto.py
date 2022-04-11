from importlib.resources import path
from flask_restx import Namespace, fields

api = Namespace('Event',
                path="/event",
                description='Event related operations')


event = api.model('Event', {

    'id': fields.Integer(
        required=True,
        description='ID of the event'),

    'description': fields.String(required=True, description='Description of the event'),
    'start_date': fields.Date(required=True, description='Start date of the event'),
    'start_time': CustomFieldTime(required=True, description='Start time 24 hours format', example="10:11"),
})


event_list = api.model('EventList', {
    'events': fields.List(fields.Nested(event), required=True)
})

error_response = api.model(
    'ErrorResponse',
    {
        'code': fields.String,
        'message': fields.String
    }
)
