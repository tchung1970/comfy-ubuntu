# Comfy Ubuntu Installer

This repository provides a clean and simple way to install **ComfyUI** on **Ubuntu 22.04** (also compatible with Ubuntu 20.04). It includes a ready-to-run Bash installer script and instructions for optional Z-Image-Turbo model setup.

## Overview

ComfyUI is a powerful, node-based interface for running AI image generation models. This project automates installation by handling:

- System package installation
- ComfyUI cloning
- Python virtual environment creation
- Dependency installation
- Folder preparation for Z-Image-Turbo
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

- Install Python, pip, venv, and Git
- Clone ComfyUI into `~/comfy`
- Create a Python venv named `ui`
- Install required Python packages
- Create necessary model directories

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

## Optional: Z-Image-Turbo Model Setup

Download and place files into:

### Text Encoder
`models/text_encoders/qwen_3_4b.safetensors`  
https://huggingface.co/Comfy-Org/z_image_turbo/resolve/main/split_files/text_encoders/qwen_3_4b.safetensors

### VAE
`models/vae/ae.safetensors`  
https://huggingface.co/Comfy-Org/z_image_turbo/resolve/main/split_files/vae/ae.safetensors

### Diffusion Model
`models/diffusion_models/z_image_turbo_bf16.safetensors`  
https://huggingface.co/Comfy-Org/z_image_turbo/resolve/main/split_files/diffusion_models/z_image_turbo_bf16.safetensors

If you get a 429 error, wait 2–5 minutes and retry.

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

