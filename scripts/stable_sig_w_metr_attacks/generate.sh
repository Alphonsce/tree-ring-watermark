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

attacks=(
    "--jpeg_ratio 25"
    "--crop_scale 0.75 --crop_ratio 0.75"
    "--gaussian_blur_r 4"
    "--gaussian_std 0.1"
    "--brightness_factor 6"
    "--r_degree 75"
)

names=(
    "jpeg"
    "crop"
    "blur"
    "noise"
    "brightness"
    "rotate"
)

PROJECT=generate_stable_tree_all_attacks
OUTPUT_ROOT=/data/varlamov_a_data/tree-ring-watermark/all_attacks

# for ((i=0; i<${#attacks[@]}; i++)); do
#     accelerate launch -m tree_ring_watermark.run_stable_tree \
#       --project_name $PROJECT \
#       --run_name ${names[i]} --w_channel 3 --w_pattern ring \
#       --start 0 --end 200 \
#       --reference_model ViT-g-14 --reference_model_pretrain laion2b_s12b_b42k \
#       --with_tracking \
#       --w_radius 10 \
#       --msg_type binary \
#       --use_random_msgs \
#       --msg_scaler 100 \
#       --save_locally \
#       --local_path $OUTPUT_ROOT/${names[i]} \
#       ${attacks[i]}
# done

# accelerate launch -m tree_ring_watermark.run_stable_tree \
#   --project_name $PROJECT \
#   --run_name diff_150 --w_channel 3 --w_pattern ring \
#   --start 0 --end 200 \
#   --reference_model ViT-g-14 --reference_model_pretrain laion2b_s12b_b42k \
#   --with_tracking \
#   --w_radius 10 \
#   --msg_type binary \
#   --use_random_msgs \
#   --msg_scaler 100 \
#   --save_locally \
#   --local_path $OUTPUT_ROOT/diff_150 \
#   --use_attack \
#   --attack_type diff \
#   --diff_attack_steps 150


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
#   --local_path $OUTPUT_ROOT/no_attack

accelerate launch -m tree_ring_watermark.run_stable_tree \
  --project_name $PROJECT \
  --run_name vae_2018_q_1 --w_channel 3 --w_pattern ring \
  --start 0 --end 200 \
  --reference_model ViT-g-14 --reference_model_pretrain laion2b_s12b_b42k \
  --with_tracking \
  --w_radius 10 \
  --msg_type binary \
  --use_random_msgs \
  --msg_scaler 100 \
  --save_locally \
  --local_path $OUTPUT_ROOT/vae_2018_q_1 \
  --use_attack \
  --attack_type vae \
  --vae_attack_name bmshj2018-factorized \
  --vae_attack_quality 1 

#-------

bash /data/varlamov_a_data/tree-ring-watermark/scripts/stable_tree_all_attacks/eval.sh