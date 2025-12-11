# Comfy Ubuntu Installer with Z-Image-Turbo models

This repository provides a clean and simple way to install **ComfyUI** on **Ubuntu 22.04 LTS** or **Ubuntu 24.04 LTS**. It includes a ready-to-run Bash installer script that automatically downloads and configures the Z-Image-Turbo model.

## Overview

ComfyUI is a powerful, node-based interface for running AI image generation models. This project automates installation by handling:

- System package installation
- ComfyUI cloning
- Python virtual environment creation
- Dependency installation
- Z-Image-Turbo model download
- Clear run instructions

## Installation

Clone this repository:

```bash
git clone https://github.com/tchung1970/comfy-ubuntu
cd comfy-ubuntu
```

Run the installer:

```bash
bash install_comfy.sh
```

The installer will automatically:

- Install Python 3 and venv packages
- Clone ComfyUI into `~/comfy`
- Create a Python venv named `ui`
- Install required Python packages
- Download Z-Image-Turbo model files

## Running ComfyUI

### Running Locally

```bash
cd ~/comfy
source ui/bin/activate
python main.py
```

Open your browser: `http://127.0.0.1:8188`

### Running Remotely

To access the UI from another machine, open port 8188 and run:

```bash
cd ~/comfy
source ui/bin/activate
python main.py --listen 0.0.0.0 --port 8188
```

Open in browser: `http://<YOUR-SERVER-IP>:8188`

## Z-Image-Turbo Models

The installer automatically downloads the following Z-Image-Turbo model files:

### Text Encoder
`~/comfy/models/text_encoders/qwen_3_4b.safetensors`

### VAE
`~/comfy/models/vae/ae.safetensors`

### Diffusion Model
`~/comfy/models/diffusion_models/z_image_turbo_bf16.safetensors`

### LoRA
`~/comfy/models/loras/pixel_art_style_z_image_turbo.safetensors`

These files are downloaded from HuggingFace:
- Z-Image-Turbo models: [Comfy-Org/z_image_turbo](https://huggingface.co/Comfy-Org/z_image_turbo)
- Pixel Art LoRA: [tarn59/pixel_art_style_lora_z_image_turbo](https://huggingface.co/tarn59/pixel_art_style_lora_z_image_turbo)

## Recommended Hardware

- Ubuntu 22.04 LTS or Ubuntu 24.04 LTS
- Python 3 (uses system default: Python 3.10 on 22.04, Python 3.12 on 24.04)
- PyTorch 2.1–2.4 + CUDA 12.1–12.4 (A10, A40, A100)
- PyTorch 2.8+ + CUDA 12.8+ (RTX 5080, RTX 5090)
- Recommended NVIDIA GPUs:
  - A10
  - A40
  - A100
  - RTX 5080
  - RTX 5090
- 32GB system RAM recommended
- Disk space requirements:
  - ComfyUI: ~5 GB
  - Z-Image-Turbo models: ~12 GB
  - Generated images/workflows: 10–50 GB
  - Recommended free space: 30–50 GB

## License

MIT License.

