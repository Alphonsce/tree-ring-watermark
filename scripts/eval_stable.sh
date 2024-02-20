accelerate launch -m tree_ring_watermark.eval_stable_tree \
  --with_tracking \
  --project_name test_eval_stable_tree \
  --run_name test \
  --eval_imgs False --eval_bits True \
  --img_dir /data/varlamov_a_data/dima/imgs_stable_tree/imgs_w \
  --output_dir /data/varlamov_a_data/tree-ring-watermark/test_stable_tree_logs \
  --msg_decoder_path /data/varlamov_a_data/tree-ring-watermark/dec_48b_whit.torchscript.pt \
  --attack_mode all