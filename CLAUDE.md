# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Repository Overview

This is a ComfyUI installer repository for Ubuntu 22.04 and 24.04 LTS. It provides an automated installation script that sets up ComfyUI, a node-based interface for AI image generation models, on Ubuntu systems.

## Architecture

The repository consists of:
- **install_comfy.sh**: Main installation script for standard Ubuntu systems (installs to `~/comfy`)
- **comfy_runpod.sh**: RunPod-specific installer for GPU instances (installs to `/workspace/comfy`)
- Both scripts create a Python virtual environment named `ui` within the ComfyUI installation
- Sets up model directories for Z-Image-Turbo (text_encoders, vae, diffusion_models)

## Key Commands

### Installation (Standard Ubuntu)
```bash
bash install_comfy.sh
```

### Installation (RunPod GPU Instance)
```bash
bash comfy_runpod.sh
```

This installer handles:
- System package installation (git, wget, python3, python3-venv, python3-dev)
- ComfyUI cloning from https://github.com/comfyanonymous/ComfyUI.git
- Python virtual environment creation
- Dependencies installation from ComfyUI's requirements.txt
- Z-Image-Turbo model files download

### Running ComfyUI (after installation)
```bash
cd ~/comfy
source ui/bin/activate
python main.py
```

Access at: http://127.0.0.1:8188

## Important Details

### Installation Location
ComfyUI is installed to `~/comfy`, NOT within this repository. This repository only contains the installer script.

### Virtual Environment
The Python venv is named `ui` (not the typical `venv` or `.venv`) and is created inside the ComfyUI directory at `~/comfy/ui/` using `python3 -m venv ui`.

### GPU Support
The installer has a commented-out section for GPU-enabled PyTorch installation (line 33-35 in install_comfy.sh). If GPU support is needed, uncomment:
```bash
pip install torch torchvision torchaudio --index-url https://download.pytorch.org/whl/cu121
```

### Model Setup
The installer automatically downloads Z-Image-Turbo model files from HuggingFace and places them in:
- `~/comfy/models/text_encoders/qwen_3_4b.safetensors`
- `~/comfy/models/vae/ae.safetensors`
- `~/comfy/models/diffusion_models/z_image_turbo_bf16.safetensors`
- `~/comfy/models/loras/pixel_art_style_z_image_turbo.safetensors`

### Target Environment
- Ubuntu 22.04 LTS or Ubuntu 24.04 LTS
- Python 3 (uses system default)
- PyTorch 2.3 + CUDA 12.1 (for GPU)
- Recommended: NVIDIA GPU (RTX 5080/5090) with 32GB system RAM
