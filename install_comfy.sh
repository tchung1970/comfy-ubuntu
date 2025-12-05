#!/usr/bin/env bash
# install_comfy.sh — install ComfyUI on Ubuntu 22.04 LTS

set -e  # exit on error

# 1. Install system requirements
sudo apt update
sudo apt install -y python3 python3-pip python3-venv git

# 2. Clone ComfyUI into ~/comfy
cd ~
if [ -d "comfy" ]; then
  echo "Directory ~/comfy already exists — skipping clone"
else
  git clone https://github.com/comfyanonymous/ComfyUI.git comfy
fi

cd comfy

# 3. Create virtual environment named "ui"
python3 -m venv ui

# 4. Activate venv
source ui/bin/activate

# 5. Upgrade pip, wheel, setuptools
pip install --upgrade pip wheel setuptools

# 6. Install ComfyUI dependencies
pip install -r requirements.txt

# 7. (Optional) Install GPU-enabled PyTorch — only if you have NVIDIA + CUDA
# You can uncomment the following block if you want GPU support:
# pip install torch torchvision torchaudio --index-url https://download.pytorch.org/whl/cu121

# 8. Create Z-Image-Turbo model directories
mkdir -p ~/comfy/models/text_encoders
mkdir -p ~/comfy/models/vae
mkdir- p ~/comfy/models/diffusion_models

echo "=== Installation complete. To run ComfyUI: ==="
echo "cd ~/comfy"
echo "source ui/bin/activate"
echo "python main.py"
echo "Then open your browser at http://127.0.0.1:8188"

