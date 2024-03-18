accelerate launch -m tree_ring_watermark.run_tree_ring_watermark_fid \
  --project_name fid_gt_msg_all_att_vae \
  --run_name diff_150 --w_channel 3 --w_pattern ring \
  --start 0 --end 500 \
  --with_tracking \
  --w_radius 10 \
  --run_generation \
  --additional_metrics \
  --run_no_w \
  --image_folder /data/varlamov_a_data/tree-ring-watermark/msg_fid_all_att_vae/diff_150  \
  --msg_type binary \
  --use_random_msgs \
  --msg_scaler 100 \
  --use_stable_sig \
  --use_attack \
  --attack_type diff \
  --diff_attack_steps 150


accelerate launch -m tree_ring_watermark.run_tree_ring_watermark_fid \
  --project_name fid_gen_msg_all_att_vae \
  --run_name diff_150 --w_channel 3 --w_pattern ring \
  --start 0 --end 500 \
  --with_tracking \
  --w_radius 10 \
  --run_generation \
  --additional_metrics \
  --run_no_w \
  --image_folder /data/varlamov_a_data/tree-ring-watermark/msg_fid_all_att_vae/diff_150  \
  --msg_type binary \
  --use_random_msgs \
  --msg_scaler 100 \
  --use_stable_sig \
  --target_clean_generated \
  --use_attack \
  --attack_type diff \
  --diff_attack_steps 150

# ----------- NO VAE BELOW: --------------

accelerate launch -m tree_ring_watermark.run_tree_ring_watermark_fid \
  --project_name fid_gt_msg_all_att_no_vae \
  --run_name diff_150 --w_channel 3 --w_pattern ring \
  --start 0 --end 500 \
  --with_tracking \
  --w_radius 10 \
  --run_generation \
  --additional_metrics \
  --run_no_w \
  --image_folder /data/varlamov_a_data/tree-ring-watermark/msg_fid_all_att_vae/diff_150  \
  --msg_type binary \
  --use_random_msgs \
  --msg_scaler 100 \
  --use_attack \
  --attack_type diff \
  --diff_attack_steps 150


accelerate launch -m tree_ring_watermark.run_tree_ring_watermark_fid \
  --project_name fid_gen_msg_all_att_no_vae \
  --run_name diff_150 --w_channel 3 --w_pattern ring \
  --start 0 --end 500 \
  --with_tracking \
  --w_radius 10 \
  --run_generation \
  --additional_metrics \
  --run_no_w \
  --image_folder /data/varlamov_a_data/tree-ring-watermark/msg_fid_all_att_vae/diff_150  \
  --msg_type binary \
  --use_random_msgs \
  --msg_scaler 100 \
  --target_clean_generated \
  --use_attack \
  --attack_type diff \
  --diff_attack_steps 150