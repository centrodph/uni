from flask_restx import fields
from datetime import time


class CustomFieldTime(fields.Raw):
    """Return time formatted as string."""
    __schema_type__ = 'string'
    __schema_format__ = 'time'

    def __init__(self, time_format='%H:%M', **kwargs):
        super().__init__(**kwargs)
        self.time_format = time_format

    def format(self, value):
        """"Generate time formatted as string."""
        try:
            value = self.parse(value)
            return value.strftime(self.time_format)
        except (AttributeError, ValueError) as e:
            raise fields.MarshallingError(e)

    def parse(self, value):
        """Parse time from string."""
        if isinstance(value, time):
            return value
        if isinstance(value, str):
            return time.fromisoformat(value, self.time_format)
        raise ValueError(
            f"Time must be a string, with format {self.time_format}")
