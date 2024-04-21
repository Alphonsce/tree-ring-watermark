S=(
    60
    70
    80
    90
)

for ((i=0; i<${#S[@]}; i++)); do
  accelerate launch -m tree_ring_watermark.run_tree_ring_watermark_fid \
    --project_name worst_message_fid_gt \
    --run_name ${S[i]} --w_channel 3 --w_pattern ring \
    --start 0 --end 5000 \
    --with_tracking \
    --w_radius 10 \
    --run_generation \
    --additional_metrics \
    --image_folder /data/varlamov_a_data/tree-ring-watermark/worst_message/fid_gt \
    --msg_type binary \
    --msg "0000000000" \
    --msg_scaler ${S[i]}
done