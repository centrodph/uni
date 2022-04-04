import os
from app import create_app

print(f"FLASK_ENV: {os.environ.get('FLASK_CONFIG')}")
app = create_app(os.getenv('FLASK_CONFIG') or 'default')
