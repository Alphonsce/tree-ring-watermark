# accelerate launch -m tree_ring_watermark.run_tree_ring_watermark_fid \
#   --project_name image_metrics \
#   --run_name test_vae_2020 --w_channel 3 --w_pattern ring \
#   --with_tracking \
#   --use_attack --attack_type vae --vae_attack_name cheng2020-anchor \
#   --vae_attack_quality 3 \
#   --run_no_w \
#   --additional_metrics

# accelerate launch -m tree_ring_watermark.run_tree_ring_watermark \
#   --run_name no_attack --w_channel 3 --w_pattern ring \
#   --start 0 --end 15 \
#   --num_inference_steps 15 \
#   --reference_model ViT-g-14 --reference_model_pretrain laion2b_s12b_b42k \
#   --freq_log 15

accelerate launch -m tree_ring_watermark.run_stable_tree \
  --project_name stable_tree \
  --run_name first_test --w_channel 3 --w_pattern ring \
  --start 0 --end 2 \
  --num_inference_steps 5 \
  --reference_model ViT-g-14 --reference_model_pretrain laion2b_s12b_b42k \
  --