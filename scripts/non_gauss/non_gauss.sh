# for ((s = 10; s <= 140; s += 10 )); do
#     for ((r = 4; r <= 32; r += 2)); do
#         accelerate launch -m tree_ring_watermark.run_stable_tree \
#           --project_name non_gauss_test \
#           --run_name "r=$r s=$s" --w_channel 3 --w_pattern ring \
#           --start 0 --end 1 \
#           --reference_model ViT-g-14 --reference_model_pretrain laion2b_s12b_b42k \
#           --with_tracking \
#           --w_radius $r \
#           --msg_type binary \
#           --use_random_msgs \
#           --msg_scaler $s \
#           --freq_log 1 \
#           --given_prompt "sci-fi bernese mountain dog" \
#           --save_rev_lat \
#           --path_rev_lat /data/varlamov_a_data/dima/plots/non_gaussianity/rev_lat_objects \
#           --no_stable_sig
#     done
# done

for ((s = 40; s <= 40; s += 10 )); do
    for ((r = 14; r <= 14; r += 2)); do
        accelerate launch -m tree_ring_watermark.run_stable_tree \
          --project_name non_gauss_test \
          --run_name "r=$r s=$s" --w_channel 3 --w_pattern ring \
          --start 0 --end 1 \
          --reference_model ViT-g-14 --reference_model_pretrain laion2b_s12b_b42k \
          --with_tracking \
          --w_radius $r \
          --msg_type binary \
          --use_random_msgs \
          --msg_scaler $s \
          --freq_log 1 \
          --given_prompt "sci-fi bernese mountain dog" \
          --save_rev_lat \
          --path_rev_lat /data/varlamov_a_data/dima/plots/non_gaussianity/rev_lat_objects \
          --no_stable_sig
    done
done