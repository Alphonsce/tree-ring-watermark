for ((r = 18; r <= 32; r += 2 )); do
    accelerate launch -m tree_ring_watermark.run_tree_ring_watermark_fid \
      --project_name fid_msg_r_gen \
      --run_name $r --w_channel 3 --w_pattern ring \
      --start 0 --end 500 \
      --with_tracking \
      --w_radius $r \
      --run_generation \
      --additional_metrics \
      --run_no_w \
      --image_folder /data/varlamov_a_data/tree-ring-watermark/msg_fid_r_gen/r=$r \
      --msg_type binary \
      --use_random_msgs \
      --msg_scaler 100 \
      --use_stable_sig \
      --target_clean_generated
done