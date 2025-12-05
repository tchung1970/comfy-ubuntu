# Comfy Ubuntu Installer

This repository provides a clean and simple way to install **ComfyUI** on **Ubuntu 22.04 LTS**. It includes a ready-to-run Bash installer script that automatically downloads and configures the Z-Image-Turbo model.

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
git clone https://github.com/<YOUR_USERNAME>/comfy-ubuntu
cd comfy-ubuntu
```

Run the installer:

```bash
bash install_comfy.sh
```

The installer will automatically:

- Install Python, pip, venv, Git, and wget
- Clone ComfyUI into `~/comfy`
- Create a Python venv named `ui`
- Install required Python packages
- Download Z-Image-Turbo model files

## Running ComfyUI

```bash
cd ~/comfy
source ui/bin/activate
python main.py
```

Open your browser:

```
http://127.0.0.1:8188
```

## Z-Image-Turbo Models

The installer automatically downloads the following Z-Image-Turbo model files:

### Text Encoder
`~/comfy/models/text_encoders/qwen_3_4b.safetensors`

### VAE
`~/comfy/models/vae/ae.safetensors`

### Diffusion Model
`~/comfy/models/diffusion_models/z_image_turbo_bf16.safetensors`

These files are downloaded from the [Comfy-Org/z_image_turbo](https://huggingface.co/Comfy-Org/z_image_turbo) repository on HuggingFace.

## Recommended Hardware

- Ubuntu 22.04 LTS
- Python 3.10
- PyTorch 2.3 + CUDA 12.1
- NVIDIA GPU (recommended):
  - RTX 4080 (16GB)
  - RTX 4090 (24GB)
  - RTX 5090 (24GB+)
- 32GB system RAM recommended

## License

MIT License.

