# rm ./finetune_ldm_normal/*.pth
# rm -r finetune_ldm_normal

# TRAIN="/data/varlamov_a_data/tree-ring-watermark/no_w_tree_ring_imgs/train"
# VAL="/data/varlamov_a_data/tree-ring-watermark/no_w_tree_ring_imgs/val"

# accelerate launch -m tree_ring_watermark.finetune_ldm_decoder --num_keys 1 \
#   --ldm_config /data/varlamov_a_data/tree-ring-watermark/stable_signature/sd/v2-inference.yaml \
#   --ldm_ckpt /data/varlamov_a_data/tree-ring-watermark/stable_signature/sd/v2-1_512-ema-pruned.ckpt \
#   --msg_decoder_path /data/varlamov_a_data/tree-ring-watermark/dec_48b_whit.torchscript.pt \
#   --train_dir $TRAIN \
#   --val_dir $VAL \
#   --with_tracking \
#   --project_name finetune_ldm_normal \
#   --run_name normal_tuning \
#   --output_dir /data/varlamov_a_data/tree-ring-watermark/finetune_ldm_normal \
#   --batch_size 4 \
#   --steps 100 \
#   --num_val_imgs 200 \
#   --not_rand_key

# # Generation:

OUTPUT_DIR="/data/varlamov_a_data/tree-ring-watermark/normal_tuned_imgs"

rm ./tree_tuned_imgs/imgs_w/*.png
rm ./tree_tuned_imgs/imgs_no_w/*.png

accelerate launch -m tree_ring_watermark.run_stable_tree \
  --project_name gen_stable_tree \
  --run_name testing_my_tree_3k_4k --w_channel 3 --w_pattern ring \
  --start 3000 --end 4000 \
  --reference_model ViT-g-14 --reference_model_pretrain laion2b_s12b_b42k \
  --with_tracking \
  --save_locally \
  --local_path $OUTPUT_DIR \
  --decoder_state_dict_path /data/varlamov_a_data/tree-ring-watermark/finetune_ldm_normal/ldm_decoder_checkpoint_000.pth

# # Evaluation:

NORMAL_VAE_VANILLA_IMGS="/data/varlamov_a_data/tree-ring-watermark/normal_tuned_imgs/imgs_no_w"

accelerate launch -m tree_ring_watermark.eval_stable_tree \
  --with_tracking \
  --project_name eval_stable_tree \
  --run_name normal_vae_vanilla_imgs \
  --eval_imgs False --eval_bits True \
  --img_dir $NORMAL_VAE_VANILLA_IMGS \
  --output_dir /data/varlamov_a_data/tree-ring-watermark/logs_normal_vanilla \
  --msg_decoder_path /data/varlamov_a_data/tree-ring-watermark/dec_48b_whit.torchscript.pt \
  --attack_mode few \
  --key_str 111010110101000001010111010011010100010000100111

# # ----With tree-ring wm:-------

NORMAL_VAE_STABLE_TREE_IMGS="/data/varlamov_a_data/tree-ring-watermark/normal_tuned_imgs/imgs_w"

accelerate launch -m tree_ring_watermark.eval_stable_tree \
  --with_tracking \
  --project_name eval_stable_tree \
  --run_name normal_vae_st_tree_imgs \
  --eval_imgs False --eval_bits True \
  --img_dir $NORMAL_VAE_STABLE_TREE_IMGS \
  --output_dir /data/varlamov_a_data/tree-ring-watermark/logs_normal_st_tree \
  --msg_decoder_path /data/varlamov_a_data/tree-ring-watermark/dec_48b_whit.torchscript.pt \
  --attack_mode few \
  --key_str 111010110101000001010111010011010100010000100111