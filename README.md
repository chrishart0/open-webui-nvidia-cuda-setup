# Open WebUI Nvidia CUDA Setup

This repo is a ready to set of infra for locally running Open WebUI and other supporting software such as image generation and Text-To-Speech integrated out of the box and ready to go.

The official Open WebUI repo has some good scripts and IaC but their need to support a broader audience means less of the bells and whistles are running out of the box.

## Configured out of the Box

Services configured to run out of the box

### Implemented

- [x] Open WebUI with local data persistence
- [X] Ollama Container utilizing GPU with local data persistence
- [ ] Local TTS with [Openedai-speech](https://github.com/matatonic/openedai-speech)
- [ ] Optionally allow public traffic to the Open WebUI container only via CloudFlare tunnel

### ToDo

- [ ] .env.example for configuring openAI
- [ ] Local network HTTPS provided by a reverse proxy container + Certbot
- [ ] Data backup functionality
- [ ] Image generation with Stable Diffusion running locally
- [ ] ... What else?

## Who is this for?

- OS: Linux
- GPU: Nvidia with CUDA enabled

## Spin it Up

Start up the docker compose stack

```bash
make run
```

View the logs

```bash
make logs
```

## Contribute
Contributions are welcome! If you have any ideas, suggestions, or improvements, feel free to open an issue or create a fork and submit a pull request against the [ GitHub repo](https://github.com/chrishart0/open-webui-nvidia-cuda-setup). We appreciate your contributions to make this project even better!

## Credit

Most credit for all the local infra must go to the Open WebUI team, this repo is just a fork of their local infra with the configuration done for my specific needs (Ubuntu / 4090).
