
accelerate launch -m tree_ring_watermark.run_tree_ring_watermark \
  --project_name msg_len_test \
  --run_name  --w_channel 3 --w_pattern ring \
  --start 0 --end 100 \
  --reference_model ViT-g-14 --reference_model_pretrain laion2b_s12b_b42k \
  --with_tracking \
  --max_num_log_image 1 \


#!/bin/bash

# Loop from 8 to 512 with step 8
for ((bits = 8; bits <= 512; bits += 8 )); do
    accelerate launch -m tree_ring_watermark.run_tree_ring_watermark \
      --project_name msg_len_test \
      --run_name  --w_channel 3 --w_pattern ring \
      --start 0 --end 100 \
      --reference_model ViT-g-14 --reference_model_pretrain laion2b_s12b_b42k \
      --with_tracking \
      --max_num_log_image 1 
done


