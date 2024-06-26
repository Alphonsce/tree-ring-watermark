attacks=(
    "--jpeg_ratio 25"
    "--crop_scale 0.75 --crop_ratio 0.75"
    "--gaussian_blur_r 4"
    "--gaussian_std 0.1"
    "--brightness_factor 6"
    "--r_degree 75"
)

names=(
    "jpeg"
    "crop"
    "blur"
    "noise"
    "brightness"
    "rotate"
)


for ((i=0; i<${#attacks[@]}; i++)); do
    accelerate launch -m tree_ring_watermark.run_tree_ring_watermark_fid \
      --project_name fid_gt_msg_all_att_no_vae \
      --run_name ${names[i]} --w_channel 3 --w_pattern ring \
      --start 0 --end 500 \
      --with_tracking \
      --w_radius 10 \
      --run_generation \
      --additional_metrics \
      --run_no_w \
      --image_folder /data/varlamov_a_data/tree-ring-watermark/msg_fid_all_att_no_vae/${names[i]}  \
      --msg_type binary \
      --use_random_msgs \
      --msg_scaler 100 \
      ${attacks[i]}
done

for ((i=0; i<${#attacks[@]}; i++)); do
    accelerate launch -m tree_ring_watermark.run_tree_ring_watermark_fid \
      --project_name fid_gen_msg_all_att_no_vae \
      --run_name ${names[i]} --w_channel 3 --w_pattern ring \
      --start 0 --end 500 \
      --with_tracking \
      --w_radius 10 \
      --run_generation \
      --additional_metrics \
      --run_no_w \
      --image_folder /data/varlamov_a_data/tree-ring-watermark/msg_fid_all_att_no_vae/${names[i]}  \
      --msg_type binary \
      --use_random_msgs \
      --msg_scaler 100 \
      ${attacks[i]} \
      --target_clean_generated
done

accelerate launch -m tree_ring_watermark.run_tree_ring_watermark_fid \
  --project_name fid_gt_msg_all_att_no_vae \
  --run_name no_attack --w_channel 3 --w_pattern ring \
  --start 0 --end 500 \
  --with_tracking \
  --w_radius 10 \
  --run_generation \
  --additional_metrics \
  --run_no_w \
  --image_folder /data/varlamov_a_data/tree-ring-watermark/msg_fid_all_att_vae/no_attack3  \
  --msg_type binary \
  --use_random_msgs \
  --msg_scaler 100 


accelerate launch -m tree_ring_watermark.run_tree_ring_watermark_fid \
  --project_name fid_gen_msg_all_att_no_vae \
  --run_name no_attack --w_channel 3 --w_pattern ring \
  --start 0 --end 500 \
  --with_tracking \
  --w_radius 10 \
  --run_generation \
  --additional_metrics \
  --run_no_w \
  --image_folder /data/varlamov_a_data/tree-ring-watermark/msg_fid_all_att_vae/no_attack4 \
  --msg_type binary \
  --use_random_msgs \
  --msg_scaler 100 \
  --target_clean_generated

accelerate launch -m tree_ring_watermark.run_tree_ring_watermark_fid \
  --project_name fid_gt_msg_all_att_no_vae \
  --run_name vae_2018_q_1 --w_channel 3 --w_pattern ring \
  --start 0 --end 500 \
  --with_tracking \
  --w_radius 10 \
  --run_generation \
  --additional_metrics \
  --run_no_w \
  --image_folder /data/varlamov_a_data/tree-ring-watermark/msg_fid_all_att_vae/vae_2018_q_1  \
  --msg_type binary \
  --use_random_msgs \
  --msg_scaler 100 \
  --use_attack \
  --attack_type vae \
  --vae_attack_name bmshj2018-factorized \
  --vae_attack_quality 1 


accelerate launch -m tree_ring_watermark.run_tree_ring_watermark_fid \
  --project_name fid_gen_msg_all_att_no_vae \
  --run_name vae_2018_q_1 --w_channel 3 --w_pattern ring \
  --start 0 --end 500 \
  --with_tracking \
  --w_radius 10 \
  --run_generation \
  --additional_metrics \
  --run_no_w \
  --image_folder /data/varlamov_a_data/tree-ring-watermark/msg_fid_all_att_vae/vae_2018_q_1  \
  --msg_type binary \
  --use_random_msgs \
  --msg_scaler 100 \
  --target_clean_generated \
  --use_attack \
  --attack_type vae \
  --vae_attack_name bmshj2018-factorized \
  --vae_attack_quality 1 