messages=(
  "1111111111"
  "0000000000"
  "1010101010"
  "1100110011"
  "0011001100"
  "1111100000"
  "0000011111"
)

for ((i=0; i<${#messages[@]}; i++)); do
  accelerate launch -m tree_ring_watermark.run_stable_tree \
    --project_name clip_different_msg \
    --run_name ${messages[i]} --w_channel 3 --w_pattern ring \
    --start 0 --end 1000 \
    --reference_model ViT-g-14 --reference_model_pretrain laion2b_s12b_b42k \
    --with_tracking \
    --w_radius 10 \
    --msg_type binary \
    --msg ${messages[i]} \
    --msg_scaler 100 
done