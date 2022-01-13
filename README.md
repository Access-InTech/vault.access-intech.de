![CI](https://github.com/Access-InTech/vault.access-intech.de/actions/workflows/ci.yaml/badge.svg)

# vault.access-intech.de

Deploy vaultwarden Docker container on an own instance.
This project is based on [dani-garcia/vaultwarden](https://github.com/dani-garcia/vaultwarden).

## How to use
1. Install [docker](https://docs.docker.com/engine/install/) and [docker-compose](https://docs.docker.com/compose/install/)
2. Clone this Repository
3. Copy `.env.example` and rename it to `.env`
4. Edit `.env` to fit your needs
5. Start the container using `docker-compose up -d`
6. [Setup the Webserver](https://github.com/dani-garcia/vaultwarden/wiki/Proxy-examples)
7. [!!! Secure your Vault !!!](https://github.com/dani-garcia/vaultwarden/wiki/Enabling-HTTPS)

