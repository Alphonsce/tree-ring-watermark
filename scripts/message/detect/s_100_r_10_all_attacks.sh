attacks=(
    "--jpeg_ratio 25"
    "--crop_scale 0.75 --crop_ratio 0.75"
    "--gaussian_blur_r 4"
    "--gaussian_std 0.1"
    "--brightness_factor 6"
)

names=(
    "jpeg"
    "crop"
    "blur"
    "noise"
    "brightness"
)

for ((i=0; i<${#attacks[@]}; i++)); do
    accelerate launch -m tree_ring_watermark.run_stable_tree \
      --project_name msg_all_attacks \
      --run_name ${names[i]} --w_channel 3 --w_pattern ring \
      --start 0 --end 200 \
      --reference_model ViT-g-14 --reference_model_pretrain laion2b_s12b_b42k \
      --with_tracking \
      --w_radius 10 \
      --msg_type binary \
      --use_random_msgs \
      --msg_scaler 100 \
      ${attacks[i]}
done