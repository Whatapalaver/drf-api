FROM python:3.7-alpine
ENV PYTHONUNBUFFERED=1

COPY requirements.txt /requirements.txt
# adding temporary dependencies required as we are using slim alpine build
RUN apk add --update --no-cache postgresql-client
RUN apk add --update --no-cache --virtual .tmp-build-deps \
  gcc libc-dev linux-headers postgresql-dev

RUN pip install -r requirements.txt
# removing the temp deps
RUN apk del .tmp-build-deps

RUN mkdir /app
WORKDIR /app
COPY ./app /app

RUN adduser -D user
USER user