# accelerate launch /data/varlamov_a_data/tree-ring-watermark/src/tree_ring_watermark/run_tree_ring_watermark_attack.py \
#   --run_name test --w_channel 3 --w_pattern ring --start 0 --end 5 --reference_model ViT-g-14 --reference_model_pretrain laion2b_s12b_b42k \
#   --with_tracking --use_attack


# accelerate launch -m tree_ring_watermark.run_tree_ring_watermark \
#   --run_name test --w_channel 3 --w_pattern ring --start 0 --end 1 --reference_model ViT-g-14 --reference_model_pretrain laion2b_s12b_b42k --num_inference_steps 5


# accelerate launch /data/varlamov_a_data/tree-ring-watermark/src/tree_ring_watermark/run_tree_ring_watermark.py
#   --run_name test --w_channel 3 --w_pattern ring --start 0 --end 1 --reference_model ViT-g-14 --reference_model_pretrain laion2b_s12b_b42k --num_inference_steps 5