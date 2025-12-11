#!/usr/bin/env bash
# comfy_runpod.sh
# Comfy RunPod Installer with Z-Image-Turbo models

set -e  # exit on error

WS=/workspace

# 1. Install system requirements
apt update
apt install -y git wget python3 python3-venv python3-dev

# 2. Clone ComfyUI into $WS/comfy
cd $WS
if [ -d "comfy" ]; then
  echo "Directory $WS/comfy already exists — skipping clone"
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

# 8. Create model directories
mkdir -p $WS/comfy/models/text_encoders
mkdir -p $WS/comfy/models/vae
mkdir -p $WS/comfy/models/diffusion_models
mkdir -p $WS/comfy/models/loras

# 9. Download Z-Image-Turbo model files
echo "=== Downloading Z-Image-Turbo model files (this may take a while) ==="

echo "Downloading text encoder (qwen_3_4b.safetensors)..."
wget -q --show-progress -O $WS/comfy/models/text_encoders/qwen_3_4b.safetensors \
  https://huggingface.co/Comfy-Org/z_image_turbo/resolve/main/split_files/text_encoders/qwen_3_4b.safetensors

echo "Downloading VAE (ae.safetensors)..."
wget -q --show-progress -O $WS/comfy/models/vae/ae.safetensors \
  https://huggingface.co/Comfy-Org/z_image_turbo/resolve/main/split_files/vae/ae.safetensors

echo "Downloading diffusion model (z_image_turbo_bf16.safetensors)..."
wget -q --show-progress -O $WS/comfy/models/diffusion_models/z_image_turbo_bf16.safetensors \
  https://huggingface.co/Comfy-Org/z_image_turbo/resolve/main/split_files/diffusion_models/z_image_turbo_bf16.safetensors

# 10. Download LoRA file
echo "Downloading LoRA (pixel_art_style_z_image_turbo.safetensors)..."
wget -q --show-progress -O $WS/comfy/models/loras/pixel_art_style_z_image_turbo.safetensors \
  https://huggingface.co/tarn59/pixel_art_style_lora_z_image_turbo/resolve/main/pixel_art_style_z_image_turbo.safetensors

echo "=== Installation complete. To run ComfyUI: ==="
echo "cd $WS/comfy"
echo "source ui/bin/activate"
echo "python main.py --listen 0.0.0.0 --port 8188"
