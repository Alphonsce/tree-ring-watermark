# accelerate launch /data/varlamov_a_data/tree-ring-watermark/src/tree_ring_watermark/run_tree_ring_watermark_attack.py \
#   --run_name test --w_channel 3 --w_pattern ring --start 0 --end 5 --reference_model ViT-g-14 --reference_model_pretrain laion2b_s12b_b42k \
#   --with_tracking --use_attack


# accelerate launch -m tree_ring_watermark.run_tree_ring_watermark_attack \
#   --run_name test_vae_2020 --w_channel 3 --w_pattern ring --start 0 --end 10 --reference_model ViT-g-14 --reference_model_pretrain laion2b_s12b_b42k \
#   --with_tracking --use_attack --attack_type vae \
#   --freq_log 2

# accelerate launch -m tree_ring_watermark.run_tree_ring_watermark_attack \
#   --run_name test_diff_prompt --w_channel 3 --w_pattern ring --start 0 --end 10 --reference_model ViT-g-14 --reference_model_pretrain laion2b_s12b_b42k \
#   --with_tracking --use_attack --use_attack_prompt \
#   --freq_log 2

# accelerate launch /data/varlamov_a_data/tree-ring-watermark/src/tree_ring_watermark/run_tree_ring_watermark.py
#   --run_name test --w_channel 3 --w_pattern ring --start 0 --end 1 --reference_model ViT-g-14 --reference_model_pretrain laion2b_s12b_b42k --num_inference_steps 5

STEPS=60

accelerate launch -m tree_ring_watermark.run_tree_ring_watermark_attack \
  --project_name diff_attacks \
  --run_name "test_$STEPS" --w_channel 3 --w_pattern ring --start 0 --end 6 --reference_model ViT-g-14 --reference_model_pretrain laion2b_s12b_b42k \
  --with_tracking \
  --use_attack --attack_type diff \
  --diff_attack_steps "$STEPS" --freq_log 2

  
# accelerate launch -m tree_ring_watermark.run_tree_ring_watermark_attack \
#   --project_name vae_2018_attacks \
#   --run_name test_vae_2018 --w_channel 3 --w_pattern ring --start 0 --end 6 --reference_model ViT-g-14 --reference_model_pretrain laion2b_s12b_b42k \
#   --with_tracking \
#   --use_attack --attack_type vae --vae_attack_name bmshj2018-factorized \
#   --vae_attack_quality 3 --freq_log 2

# accelerate launch -m tree_ring_watermark.run_tree_ring_watermark_attack \
#   --project_name vae_2020_attacks \
#   --run_name test_vae_2020 --w_channel 3 --w_pattern ring --start 0 --end 6 --reference_model ViT-g-14 --reference_model_pretrain laion2b_s12b_b42k \
#   --with_tracking \
#   --use_attack --attack_type vae --vae_attack_name cheng2020-anchor \
#   --vae_attack_quality 3 --freq_log 2