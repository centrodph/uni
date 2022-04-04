from flask import Flask
from flask_sqlalchemy import SQLAlchemy
from flask_marshmallow import Marshmallow
from config import config_by_name


def create_app(config_name: str):
    app = Flask(__name__)
    app.config.from_object(config_by_name[config_name])
    return app
