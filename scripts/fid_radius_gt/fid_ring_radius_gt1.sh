for ((r = 2; r <= 16; r += 2 )); do
    accelerate launch -m tree_ring_watermark.run_tree_ring_watermark_fid \
      --project_name fid_r_gt \
      --run_name $r --w_channel 3 --w_pattern ring \
      --start 0 --end 500 \
      --with_tracking \
      --w_radius $r \
      --run_generation \
      --additional_metrics \
      --run_no_w \
      --image_folder /data/varlamov_a_data/tree-ring-watermark/radius_fid_gt/$r
done