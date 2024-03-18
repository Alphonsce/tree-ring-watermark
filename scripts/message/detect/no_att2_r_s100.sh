for ((r = 34; r <= 62; r += 2 )); do
    accelerate launch -m tree_ring_watermark.run_stable_tree \
      --project_name msg_long_detect_no_att \
      --run_name $r --w_channel 3 --w_pattern ring \
      --start 0 --end 500 \
      --reference_model ViT-g-14 --reference_model_pretrain laion2b_s12b_b42k \
      --with_tracking \
      --w_radius $r \
      --msg_type binary \
      --use_random_msgs \
      --msg_scaler 100 
done