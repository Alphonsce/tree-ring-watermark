accelerate launch -m tree_ring_watermark.run_stable_tree \
  --project_name detect_msg_all_att_no_vae \
  --run_name diff_150 --w_channel 3 --w_pattern ring \
  --start 0 --end 200 \
  --reference_model ViT-g-14 --reference_model_pretrain laion2b_s12b_b42k \
  --with_tracking \
  --w_radius 10 \
  --msg_type binary \
  --use_random_msgs \
  --msg_scaler 100 \
  --no_stable_sig \
  --use_attack \
  --attack_type diff \
  --diff_attack_steps 150

accelerate launch -m tree_ring_watermark.run_stable_tree \
  --project_name detect_msg_all_att_vae \
  --run_name diff_150 --w_channel 3 --w_pattern ring \
  --start 0 --end 200 \
  --reference_model ViT-g-14 --reference_model_pretrain laion2b_s12b_b42k \
  --with_tracking \
  --w_radius 10 \
  --msg_type binary \
  --use_random_msgs \
  --msg_scaler 100 \
  --use_attack \
  --attack_type diff \
  --diff_attack_steps 150

accelerate launch -m tree_ring_watermark.run_stable_tree \
  --project_name detect_msg_all_att_vae \
  --run_name diff_150 --w_channel 3 --w_pattern ring \
  --start 0 --end 200 \
  --reference_model ViT-g-14 --reference_model_pretrain laion2b_s12b_b42k \
  --with_tracking \
  --w_radius 10 \
  --msg_type binary \
  --use_random_msgs \
  --msg_scaler 100 \
  --use_attack \
  --attack_type vae \
  --vae_attack_name bmshj2018-factorized \
  --vae_attack_quality 1 