accelerate launch /data/varlamov_a_data/tree-ring-watermark/stable_signature/run_evals.py \
  --eval_imgs False --eval_bits True \
  --img_dir /data/varlamov_a_data/dima/imgs_stable_tree/imgs_w \
  --output_dir /data/varlamov_a_data/tree-ring-watermark/stable_tree_logs \
  --msg_decoder_path /data/varlamov_a_data/tree-ring-watermark/dec_48b_whit.torchscript.pt \
  --attack_mode none