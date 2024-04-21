messages=(
  # "1111111111"
  # "0000000000"
  # "1010101010"
  # "1100110011"
  # "0011001100"
  "1111100000"
  "0000011111"
)

for ((i=0; i<${#messages[@]}; i++)); do
  accelerate launch -m tree_ring_watermark.run_tree_ring_watermark_fid \
    --project_name fid_gt_message_dependency \
    --run_name ${messages[i]} --w_channel 3 --w_pattern ring \
    --start 0 --end 5000 \
    --with_tracking \
    --w_radius 10 \
    --run_generation \
    --additional_metrics \
    --image_folder /data/varlamov_a_data/tree-ring-watermark/fid_message_dependency/fid_gt \
    --msg_type binary \
    --msg ${messages[i]} \
    --msg_scaler 100 
done