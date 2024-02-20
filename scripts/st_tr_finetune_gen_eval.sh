rm ./finetune_ldm_decoder/*.pth
rm -r finetune_ldm_decoder

accelerate launch -m tree_ring_watermark.finetune_ldm_decoder --num_keys 1 \
  --ldm_config /data/varlamov_a_data/tree-ring-watermark/stable_signature/sd/v2-inference.yaml \
  --ldm_ckpt /data/varlamov_a_data/tree-ring-watermark/stable_signature/sd/v2-1_512-ema-pruned.ckpt \
  --msg_decoder_path /data/varlamov_a_data/tree-ring-watermark/dec_48b_whit.torchscript.pt \
  --train_dir /data/varlamov_a_data/tree-ring-watermark/tree_ring_imgs/train/0 \
  --val_dir /data/varlamov_a_data/tree-ring-watermark/tree_ring_imgs/val/0 \
  --with_tracking \
  --project_name finetune_ldm_decoder \
  --run_name check_run \
  --output_dir /data/varlamov_a_data/tree-ring-watermark/finetune_ldm_decoder \
  --batch_size 4 \
  --steps 100 \
  --num_val_imgs 200 \
  --num_keys 1 \
  --not_rand_key

# # Generation:

# rm ./tree_tuned_imgs/imgs_w/*.png
# rm ./tree_tuned_imgs/imgs_no_w/*.png

# accelerate launch -m tree_ring_watermark.run_stable_tree \
#   --project_name gen_stable_tree \
#   --run_name testing_my_tree_3k_4k --w_channel 3 --w_pattern ring \
#   --start 3000 --end 4000 \
#   --reference_model ViT-g-14 --reference_model_pretrain laion2b_s12b_b42k \
#   --with_tracking \
#   --save_locally \
#   --local_path /data/varlamov_a_data/tree-ring-watermark/tree_tuned_imgs \
#   --decoder_state_dict_path /data/varlamov_a_data/tree-ring-watermark/finetune_ldm_decoder/ldm_decoder_checkpoint_000.pth

# Evaluation:

ST_TREE_VAE_VANILLA_IMGS="/data/varlamov_a_data/tree-ring-watermark/tree_tuned_imgs/imgs_no_w"

accelerate launch -m tree_ring_watermark.eval_stable_tree \
  --with_tracking \
  --project_name eval_stable_tree \
  --run_name vae_st_tr_imgs_no_tree \
  --eval_imgs False --eval_bits True \
  --img_dir $ST_TREE_VAE_VANILLA_IMGS \
  --output_dir /data/varlamov_a_data/tree-ring-watermark/logs_vae_st_tr_imgs_st_tr \
  --msg_decoder_path /data/varlamov_a_data/tree-ring-watermark/dec_48b_whit.torchscript.pt \
  --attack_mode few \
  --key_str 111010110101000001010111010011010100010000100111

# ----With tree-ring wm:-------

ST_TREE_VAE_STABLE_TREE_IMGS="/data/varlamov_a_data/tree-ring-watermark/tree_tuned_imgs/imgs_w"

accelerate launch -m tree_ring_watermark.eval_stable_tree \
  --with_tracking \
  --project_name eval_stable_tree \
  --run_name vae_st_tr_imgs_st_tr \
  --eval_imgs False --eval_bits True \
  --img_dir $ST_TREE_VAE_STABLE_TREE_IMGS \
  --output_dir /data/varlamov_a_data/tree-ring-watermark/logs_vae_st_tr_imgs_st_tr \
  --msg_decoder_path /data/varlamov_a_data/tree-ring-watermark/dec_48b_whit.torchscript.pt \
  --attack_mode few \
  --key_str 111010110101000001010111010011010100010000100111