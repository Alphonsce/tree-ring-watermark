accelerate launch -m tree_ring_watermark.run_tree_ring_watermark_fid \
  --project_name fid_gt_msg_all_att_vae \
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
  --use_stable_sig \
  --use_attack \
  --attack_type vae \
  --vae_attack_name bmshj2018-factorized \
  --vae_attack_quality 1 


accelerate launch -m tree_ring_watermark.run_tree_ring_watermark_fid \
  --project_name fid_gen_msg_all_att_vae \
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
  --use_stable_sig \
  --target_clean_generated \
  --use_attack \
  --attack_type vae \
  --vae_attack_name bmshj2018-factorized \
  --vae_attack_quality 1 

# ----------- NO VAE BELOW: --------------

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

