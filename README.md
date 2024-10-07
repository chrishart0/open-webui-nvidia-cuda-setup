# Open WebUI Nvidia CUDA Setup

This repo is a ready to set of infra for locally running Open WebUI and Ollama in docker along with other supporting software such as image generation and Text-To-Speech integrated out of the box and ready to go.

The official Open WebUI repo has some good scripts and IaC but their need to support a broader audience means less of the bells and whistles are running out of the box.

## Configured out of the Box

Services configured to run out of the box

### Implemented

- [x] Open WebUI with local data persistence in `./data/open-webui`
- [X] Ollama Container utilizing GPU with local data persistence in `./data/ollama`
- [X] Local TTS with [Openedai-speech](https://github.com/matatonic/openedai-speech) configure out of the box
- [X] Support CloudFlare Tunnel into OpenWeb UI

### ToDo

- [ ] Basic GitHub actions workflow to test initial setup 
- [ ] Make CloudFlare tunnel optional
- [ ] Local network HTTPS provided by a reverse proxy container + Certbot
- [ ] Data backup functionality
- [ ] Image generation with Stable Diffusion running locally
- [ ] ... What else?

## Who is this for?

- OS: Linux
- GPU: Nvidia with CUDA enabled

## Spin it Up

Setup initial configs
```bash
make setup
```

The defaults are enough, but open up [.env.open-webui](./.env.open-webui) and see if you want to reconfigure anything

Start up the docker compose stack

```bash
make run
```

*Want to change how the stack spins up? Edit the Makefile or run ./run-compose.sh with your own flags.*


View the logs

```bash
make logs
```

Delete all the data for OpenWeb UI and Ollama
```bash
make clean
```

## Customizing Text-To-Speech Voice

To select other text-to-speech voice or train your own read more at: <https://github.com/matatonic/openedai-speech/tree/main?tab=readme-ov-file#custom-voices-howto>

## Setup CloudFlare tunnel

1. Go setup your free tier tunnel <https://www.cloudflare.com/products/tunnel/>
2. Get a CloudFlare tunnel token: <https://developers.cloudflare.com/cloudflare-one/identity/service-tokens/#create-a-service-token>
3. Copy the `.env.cloudflared.example` to create a `.env.cloudflared` and put your new token into it

## Contribute
Contributions are welcome! If you have any ideas, suggestions, or improvements, feel free to open an issue or create a fork and submit a pull request against the [ GitHub repo](https://github.com/chrishart0/open-webui-nvidia-cuda-setup). We appreciate your contributions to make this project even better!

## Credit

Most credit for all the local infra must go to the Open WebUI team, this repo is just a fork of their local infra with the configuration done for my specific needs (Ubuntu / 4090).
