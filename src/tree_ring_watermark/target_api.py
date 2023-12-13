#!/usr/bin/env python3
import torch
import torchvision
import argparse

from diffusers import DPMSolverMultistepScheduler, DiffusionPipeline, DDIMScheduler
from .inverse_stable_diffusion import InversableStableDiffusionPipeline

from ._get_noise import get_noise
from ._detect import detect

from PIL import Image
import requests
from io import BytesIO

def main(args):
    model_id = 'stabilityai/stable-diffusion-2-1-base'

    org_name = args.org_name
    model_hash = args.model_hash
    # load model
    device = 'cuda' if torch.cuda.is_available() else 'cpu'

    # IMPORTANT: We need to make sure to be able to use a normal diffusion pipeline so that people see 
    # the tree-ring-watermark method as general enough
    scheduler = DPMSolverMultistepScheduler.from_pretrained(model_id, subfolder='scheduler')
    # or
    scheduler = DDIMScheduler.from_pretrained(model_id, subfolder='scheduler')
    pipe = DiffusionPipeline.from_pretrained(model_id, scheduler=scheduler, torch_dtype=torch.float16)
    pipe = pipe.to(device)

    shape = (1, 4, 64, 64)
    latents, w_key, w_mask = get_noise(shape, model_hash, org=org_name)

    watermarked_image = pipe(prompt="an astronaut", latents=latents).images[0]

    is_watermarked = detect(watermarked_image, pipe, model_hash, org=org_name)
    print(f'is_watermarked: {is_watermarked}')

if __name__ == '__main__':
    parser = argparse.ArgumentParser(description='diffusion watermark')
    parser.add_argument('--org_name', default='Alphonsce')
    parser.add_argument('--model_hash', default='StableWM')

    args = parser.parse_args()
    
    main(args)