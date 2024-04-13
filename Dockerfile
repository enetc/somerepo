FROM python:3.10-buster

ENV PYTHONBUFFERED=1

WORKDIR /tododjangoapp

COPY requirements.txt requirements.txt

# RUN apt-get update \
#     && apt-get install -y --no-install-recommends \
#        postgresql-client

RUN pip3 install -r requirements.txt

COPY . .

CMD gunicorn To_Do_List.wsgi:application --bind 0.0.0.0:8000

EXPOSE 8000
