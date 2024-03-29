# attacks=(
#     "--jpeg_ratio 25"
#     "--crop_scale 0.75 --crop_ratio 0.75"
#     "--gaussian_blur_r 4"
#     "--gaussian_std 0.1"
#     "--brightness_factor 6"
#     "--r_degree 75"
# )

names=(
    # "jpeg"
    # "crop"
    # "blur"
    # "noise"
    # "brightness"
    # "rotate"
    # "diff_150"
    # "no_attack"
    "vae_2018_q_1"
)

PROJECT=eval_stable_tree_all_attacks
IMG_ROOT=/data/varlamov_a_data/tree-ring-watermark/all_attacks


for ((i=0; i<${#names[@]}; i++)); do
    accelerate launch -m tree_ring_watermark.eval_stable_tree \
      --with_tracking \
      --project_name $PROJECT \
      --run_name ${names[i]} \
      --eval_imgs False --eval_bits True \
      --img_dir $IMG_ROOT/${names[i]}/imgs_w \
      --output_dir /data/varlamov_a_data/tree-ring-watermark/all_attacks_logs \
      --msg_decoder_path /data/varlamov_a_data/tree-ring-watermark/dec_48b_whit.torchscript.pt \
      --attack_mode none \
      --key_str 111010110101000001010111010011010100010000100111
done