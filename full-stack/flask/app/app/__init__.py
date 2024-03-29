from flask import Flask
from flask_sqlalchemy import SQLAlchemy
from flask_marshmallow import Marshmallow
from config import config_by_name


db = SQLAlchemy()
ma = Marshmallow()


def create_app(config_name: str):
    app = Flask(__name__)
    app.config.from_object(config_by_name[config_name])

    # Initialize database
    db.init_app(app)
    ma.init_app(app)

    from app.models.event import Event
    from app.api import api_bp

    app.register_blueprint(api_bp)

    return app
