<div align="center">
  <h1>YTDL API</h1>
  <p>
    <strong>A Docker image to download YouTube songs.</strong>
  </p>
</div>

## About

YTDL API: A Docker image to download YouTube songs, plug and play into any project of yours and download YouTube songs in a simple API call.

## Usage

### Pull Image

Use [mbaraa/dankmuzikk-ytdl:latest](https://hub.docker.com/repository/docker/mbaraa/dankmuzikk-ytdl)

### Build image

1. Clone the repo.

```bash
git clone https://github.com/dank-stuff/dankmuzikk-ytdl
```

2. Create the docker environment file

```bash
cp .env.example .env.docker
```

3. Create required directories

```bash
mkdir -p .serve/{muzikkx,pix} .google-chrome-data
```

4. Copy Google Chrome's data directory into `.google-chrome-data`

5. Run using Docker compose

```bash
docker compose up
```

6. Download songs by calling `http://localhost:4321/download/{video_id}`

example:

```bash
curl http://localhost:4321/download/dQw4w9WgXcQ
```

7. You should see the song as mp3 under `<BLOBS_DIR>/muzikkx` and its thumbnail under `<BLOBS_DIR>/pix`.

---

A [DankStuff <img height="16" width="16" src="https://dankstuff.net/assets/favicon.ico" />](https://dankstuff.net) product!

Made with 🧉 by [Baraa Al-Masri](https://mbaraa.com)
