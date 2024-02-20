rm ./finetune_ldm_decoder/*.pth

COCO_DATA=/data/varlamov_a_data/dima/fid_outputs/coco/ground_truth
TR_WM_DATA=/data/varlamov_a_data/tree-ring-watermark/tree_ring_imgs/train/0 

accelerate launch -m tree_ring_watermark.finetune_ldm_decoder --num_keys 1 \
  --ldm_config /data/varlamov_a_data/tree-ring-watermark/stable_signature/sd/v2-inference.yaml \
  --ldm_ckpt /data/varlamov_a_data/tree-ring-watermark/stable_signature/sd/v2-1_512-ema-pruned.ckpt \
  --msg_decoder_path /data/varlamov_a_data/tree-ring-watermark/dec_48b_whit.torchscript.pt \
  --train_dir $COCO_DATA \
  --val_dir /data/varlamov_a_data/tree-ring-watermark/tree_ring_imgs/val/0 \
  --with_tracking \
  --project_name finetune_ldm_decoder \
  --run_name check_run \
  --output_dir /data/varlamov_a_data/tree-ring-watermark/finetune_ldm_decoder \
  --batch_size 4 \
  --steps 100 \
  --num_val_imgs 200 \
  --not_rand_key \
  --num_keys 1 