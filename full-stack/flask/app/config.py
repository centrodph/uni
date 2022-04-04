import os

BASE_DIR = os.path.abspath(os.path.dirname(__file__))

print(f"BASE_DIR: {BASE_DIR}")


class Config:
    DEBUG = False
    RESTX_MASK_SWAGGER = False


class DevelopmentConfig(Config):
    DEBUG = True
    SQLALCHEMY_DATABASE_URI = os.environ.get(
        "DATABASE_URI", "sqlite:///" + os.path.join(BASE_DIR, "data-dev.db"))


class TestingConfig(Config):
    TESTING = True
    DEBUG = True
    SQLALCHEMY_DATABASE_URI = os.environ.get(
        "DATABASE_URI", "sqlite:///:memory")

class ProductionConfig(Config):
    DEBUG = False
    SQLALCHEMY_DATABASE_URI = os.environ.get(
        "DATABASE_URI", "sqlite:///" + os.path.join(BASE_DIR, "data-prod.db"))    


config_by_name = dict(
    development=DevelopmentConfig,
    testing=TestingConfig,
    production=ProductionConfig,
    default=DevelopmentConfig,
)
