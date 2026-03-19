FROM python:3.13-alpine

LABEL org.opencontainers.image.title="YTDL API"
LABEL org.opencontainers.image.description="A Docker image to download YouTube songs."
LABEL org.opencontainers.image.url="https://github.com/dank-stuff/dankmuzikk-ytdl"
LABEL org.opencontainers.image.source="https://github.com/dank-stuff/dankmuzikk-ytdl"
LABEL org.opencontainers.image.version="latest"
LABEL org.opencontainers.image.licenses="GPL-3.0"
LABEL org.opencontainers.image.vendor="DankStuff"
LABEL org.opencontainers.image.authors="mbaraa"
LABEL maintainer="mbaraa"
LABEL com.github.repo="dank-stuff/dankmuzikk-ytdl"
LABEL org.opencontainers.image.documentation="https://github.com/dank-stuff/dankmuzikk-ytdl/blob/main/README.md"

ENV PYTHONDONTWRITEBYTECODE=1
ENV PYTHONUNBUFFERED=1

RUN apk update && \
    apk add --no-cache ffmpeg nodejs

COPY requirements.txt /app/requirements.txt

RUN pip install --upgrade pip
RUN pip install -r /app/requirements.txt
RUN pip install -U "yt-dlp[default]"
RUN pip install yt-dlp-ejs

COPY . /app
WORKDIR /app

EXPOSE 4321
CMD [ "gunicorn", "--timeout", "600", "-w", "2", "-b", "0.0.0.0:4321", "main:app" ]
