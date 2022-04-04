import os
from flask_migrate import Migrate
from app import create_app, db

print(f"FLASK_ENV: {os.environ.get('FLASK_CONFIG')}")
app = create_app(os.getenv('FLASK_CONFIG') or 'default')

migrate = Migrate(app, db)