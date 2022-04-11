from flask_restx import Api
from flask import Blueprint

from .event.controller import event_api

api_bp = Blueprint('api', __name__)


api = Api(api_bp, title="Flask restX full example")
api.add_namespace(event_api)