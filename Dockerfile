# alpine: a lightweight python image
FROM python:3.7-alpine
MAINTAINER Andras Udvari

# it is recommended, when running python in a docker env
ENV PYTHONUNBUFFERED 1

COPY ./requirements.txt requirements.txt
RUN pip install -r /requirements.txt

RUN mkdir /app
WORKDIR /app
COPY ./app /app

# this is for security, if not specified, image run as root
RUN adduser -D user
USER user

# if requirements.txt created, build this docker image with (from terminal):
#docker build .
