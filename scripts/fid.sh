for RUN in 1 2 3; do
accelerate launch -m tree_ring_watermark.run_tree_ring_watermark_fid \
  --project_name fid_gen_no_att_$RUN \
  --run_name fid_gen \
  --w_channel 3 \
  --w_pattern ring \
  --start 0 --end 5000 \
  --with_tracking \
  --run_no_w \
  --target_clean_generated
done