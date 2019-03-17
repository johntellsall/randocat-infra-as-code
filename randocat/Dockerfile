FROM python:3.7

ENV PYTHONUNBUFFERED 1
RUN mkdir /code
WORKDIR /code

COPY requirements.txt /code/
RUN pip install -qr requirements.txt

# COPY . /code/