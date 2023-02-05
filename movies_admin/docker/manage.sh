#!/bin/bash
python3 manage.py migrate --fake movies 0001_initial
python3 manage.py migrate
python3 manage.py createsuperuser --username admin --no-input
python3 sqlite_to_postgres/load_data.py
python3 sqlite_to_postgres/test_load_data.py
python3 manage.py collectstatic --no-input --clear
uwsgi --strict --ini uwsgi/uwsgi.ini