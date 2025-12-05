# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Repository Overview

This is a ComfyUI installer repository for Ubuntu 22.04 (compatible with Ubuntu 20.04). It provides an automated installation script that sets up ComfyUI, a node-based interface for AI image generation models, on Ubuntu systems.

## Architecture

The repository consists of:
- **install_comfy.sh**: Main installation script that automates the entire ComfyUI setup process
- Installs ComfyUI into `~/comfy` directory (not in this repo)
- Creates a Python virtual environment named `ui` within the ComfyUI installation
- Sets up model directories for Z-Image-Turbo (text_encoders, vae, diffusion_models)

## Key Commands

### Installation
```bash
bash install_comfy.sh
```

This installer handles:
- System package installation (python3, pip, venv, git)
- ComfyUI cloning from https://github.com/comfyanonymous/ComfyUI.git
- Python virtual environment creation
- Dependencies installation from ComfyUI's requirements.txt
- Model directory creation

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
The Python venv is named `ui` (not the typical `venv` or `.venv`) and is created inside the ComfyUI directory at `~/comfy/ui/`.

### GPU Support
The installer has a commented-out section for GPU-enabled PyTorch installation (line 33-34 in install_comfy.sh). If GPU support is needed, uncomment:
```bash
pip install torch torchvision torchaudio --index-url https://download.pytorch.org/whl/cu121
```

### Model Setup
The installer creates directories for Z-Image-Turbo models but does not download them. Models must be manually downloaded from HuggingFace URLs listed in README.md and placed in:
- `~/comfy/models/text_encoders/`
- `~/comfy/models/vae/`
- `~/comfy/models/diffusion_models/`

### Target Environment
- Ubuntu 22.04 LTS (also compatible with 20.04)
- Python 3.10
- PyTorch 2.3 + CUDA 12.1 (for GPU)
- Recommended: NVIDIA GPU (RTX 4080/4090/5090) with 32GB system RAM
