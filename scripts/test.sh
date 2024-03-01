# accelerate launch -m tree_ring_watermark.run_stable_tree \
#   --project_name vae_distr_change \
#   --run_name test --w_channel 3 --w_pattern ring \
#   --start 0 --end 1 \
#   --reference_model ViT-g-14 --reference_model_pretrain laion2b_s12b_b42k \
#   --decoder_state_dict_path /data/varlamov_a_data/tree-ring-watermark/finetune_ldm_decoder/ldm_decoder_checkpoint_000.pth

# accelerate launch -m tree_ring_watermark.run_stable_tree \
#   --project_name all_channels_stable_tree_basic_rings_test \
#   --run_name test --w_channel -1 --w_pattern ring \
#   --start 0 --end 500 \
#   --reference_model ViT-g-14 --reference_model_pretrain laion2b_s12b_b42k \
#   --with_tracking \
#   --use_attack --attack_type diff \
#   --diff_attack_steps 10 \
#   --w_radius 10

# accelerate launch -m tree_ring_watermark.finetune_ldm_decoder --num_keys 1 \
#   --ldm_config /data/varlamov_a_data/tree-ring-watermark/stable_signature/sd/v2-inference.yaml \
#   --ldm_ckpt /data/varlamov_a_data/tree-ring-watermark/stable_signature/sd/v2-1_512-ema-pruned.ckpt \
#   --msg_decoder_path /data/varlamov_a_data/tree-ring-watermark/dec_48b_whit.torchscript.pt \
#   --train_dir /data/varlamov_a_data/tree-ring-watermark/tree_ring_imgs/train/0 \
#   --val_dir /data/varlamov_a_data/tree-ring-watermark/tree_ring_imgs/val/0 \
#   --output_dir /data/varlamov_a_data/tree-ring-watermark/test_finetune \
#   --batch_size 4 \
#   --steps 1 \
#   --num_val_imgs 1 \
#   --num_keys 1 \
#   --not_rand_key

# r=10

# accelerate launch -m tree_ring_watermark.run_tree_ring_watermark_fid \
#   --project_name fid_testing_ \
#   --run_name $r --w_channel 3 --w_pattern ring \
#   --start 0 --end 3 \
#   --num_inference_steps 10 \
#   --with_tracking \
#   --w_radius $r \
#   --run_generation \
#   --run_no_w \
#   --image_folder /data/varlamov_a_data/tree-ring-watermark/radius_fid_testing_gt/$r \
#   --additional_metrics

# bash ./scripts/fig_radius_gen/fid_ring_radius_gen2.sh


# accelerate launch -m tree_ring_watermark.run_stable_tree \
#   --project_name message \
#   --run_name binary_sc_100 --w_channel 3 --w_pattern ring \
#   --start 0 --end 5 \
#   --reference_model ViT-g-14 --reference_model_pretrain laion2b_s12b_b42k \
#   --w_radius 10 \
#   --with_tracking \
#   --msg_type binary \
#   --msg_scaler 100 \
#   --freq_log 5 

# accelerate launch -m tree_ring_watermark.run_stable_tree \
#   --project_name message \
#   --run_name binary_sc_100 --w_channel 3 --w_pattern ring \
#   --start 0 --end 1 \
#   --reference_model ViT-g-14 --reference_model_pretrain laion2b_s12b_b42k \
#   --w_radius 10 \
#   --msg_type binary \
#   --msg_scaler 100

accelerate launch -m tree_ring_watermark.run_stable_tree \
  --project_name rand_msg_test \
  --run_name test --w_channel 3 --w_pattern ring \
  --start 0 --end 50 \
  --reference_model ViT-g-14 --reference_model_pretrain laion2b_s12b_b42k \
  --with_tracking \
  --w_radius 10 \
  --msg_type binary \
  --msg_scaler 100 \
  --use_random_msgs \
  --freq_log 5