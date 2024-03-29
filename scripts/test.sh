# PROJECT=generate_stable_tree_all_attacks
# OUTPUT_ROOT=/data/varlamov_a_data/tree-ring-watermark/all_attacks


# accelerate launch -m tree_ring_watermark.run_stable_tree \
#   --project_name $PROJECT \
#   --run_name no_attack --w_channel 3 --w_pattern ring \
#   --start 0 --end 200 \
#   --reference_model ViT-g-14 --reference_model_pretrain laion2b_s12b_b42k \
#   --with_tracking \
#   --w_radius 10 \
#   --msg_type binary \
#   --use_random_msgs \
#   --msg_scaler 100 \
#   --save_locally \
#   --local_path $OUTPUT_ROOT/no_attack \
#   --use_attack 

# #-------

# accelerate launch -m tree_ring_watermark.eval_stable_tree \
#   --with_tracking \
#   --project_name $PROJECT \
#   --run_name no_attack \
#   --eval_imgs False --eval_bits True \
#   --img_dir $IMG_ROOT/no_attack/imgs_w \
#   --output_dir /data/varlamov_a_data/tree-ring-watermark/all_attacks_logs \
#   --msg_decoder_path /data/varlamov_a_data/tree-ring-watermark/dec_48b_whit.torchscript.pt \
#   --attack_mode none \
#   --key_str 111010110101000001010111010011010100010000100111
