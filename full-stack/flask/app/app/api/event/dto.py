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
})
