# # Generation:

attacks=(
    "--brightness_factor 6"
    "--r_degree 75"
)

names=(
    "brightness"
    "rotate"
)

PROJECT=generate_stable_tree_all_attacks
OUTPUT_ROOT=/data/varlamov_a_data/tree-ring-watermark/all_attacks/stable_sig

for ((i=0; i<${#attacks[@]}; i++)); do
    accelerate launch -m tree_ring_watermark.run_stable_tree \
      --project_name $PROJECT \
      --run_name ${names[i]} --w_channel 3 --w_pattern ring \
      --start 0 --end 1000 \
      --reference_model ViT-g-14 --reference_model_pretrain laion2b_s12b_b42k \
      --with_tracking \
      --w_radius 10 \
      --msg_type binary \
      --use_random_msgs \
      --msg_scaler 100 \
      --save_locally \
      --local_path $OUTPUT_ROOT/${names[i]} \
      ${attacks[i]}
done

accelerate launch -m tree_ring_watermark.run_stable_tree \
  --project_name $PROJECT \
  --run_name diff_150 --w_channel 3 --w_pattern ring \
  --start 0 --end 1000 \
  --reference_model ViT-g-14 --reference_model_pretrain laion2b_s12b_b42k \
  --with_tracking \
  --w_radius 10 \
  --msg_type binary \
  --use_random_msgs \
  --msg_scaler 100 \
  --save_locally \
  --local_path $OUTPUT_ROOT/diff_150 \
  --use_attack \
  --attack_type diff \
  --diff_attack_steps 150


accelerate launch -m tree_ring_watermark.run_stable_tree \
  --project_name $PROJECT \
  --run_name no_attack --w_channel 3 --w_pattern ring \
  --start 0 --end 1000 \
  --reference_model ViT-g-14 --reference_model_pretrain laion2b_s12b_b42k \
  --with_tracking \
  --w_radius 10 \
  --msg_type binary \
  --use_random_msgs \
  --msg_scaler 100 \
  --save_locally \
  --local_path $OUTPUT_ROOT/no_attack

accelerate launch -m tree_ring_watermark.run_stable_tree \
  --project_name $PROJECT \
  --run_name vae_2018_q_1 --w_channel 3 --w_pattern ring \
  --start 0 --end 1000 \
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

#------- EVALUATION:


PROJECT_EVAL=eval_stable_tree_all_attacks
names_eval=(
    "brightness"
    "rotate"
    "diff_150"
    "no_attack"
    "vae_2018_q_1"
)


for ((i=0; i<${#names_eval[@]}; i++)); do
    accelerate launch -m tree_ring_watermark.eval_stable_tree \
      --with_tracking \
      --project_name $PROJECT_EVAL \
      --run_name ${names_eval[i]} \
      --eval_imgs False --eval_bits True \
      --img_dir $OUTPUT_ROOT/${names_eval[i]}/imgs_w \
      --output_dir /data/varlamov_a_data/tree-ring-watermark/all_attacks_logs \
      --msg_decoder_path /data/varlamov_a_data/tree-ring-watermark/dec_48b_whit.torchscript.pt \
      --attack_mode none \
      --key_str 111010110101000001010111010011010100010000100111
done