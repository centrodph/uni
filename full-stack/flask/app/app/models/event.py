from enum import unique
from app import db


class Event(db.Model):
    id = db.Column(db.Integer, primary_key=True)
    description = db.Column(db.String(100), nullable=False, unique=True)
    start_date = db.Column(db.Date, nullable=False)
    start_time = db.Column(db.Time, nullable=False)