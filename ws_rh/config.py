import os

class Config:
    SQLALCHEMY_DATABASE_URI = 'postgresql://postgres:azerty123@localhost:5432/postgres'
    SQLALCHEMY_TRACK_MODIFICATIONS = False
    SECRET_KEY = os.environ.get('SECRET_KEY') or 'you-will-never-guess'
