for ((r = 36; r <= 48; r += 2 )); do
    accelerate launch -m tree_ring_watermark.run_stable_tree \
      --project_name detect_dist_r \
      --run_name $r --w_channel 3 --w_pattern ring \
      --start 0 --end 50 \
      --reference_model ViT-g-14 --reference_model_pretrain laion2b_s12b_b42k \
      --with_tracking \
      --w_radius $r
done