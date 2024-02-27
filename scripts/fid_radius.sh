gt_dir="/data/varlamov_a_data/tree-ring-watermark/scripts/fid_radius_gt"

tmux new-session -d -s fid_gt1 'bash $gt_dir/fid_ring_radius_gt1.sh'

tmux new-session -d -s fid_gt2 'bash $gt_dir/fid_ring_radius_gt2.sh'

tmux new-session -d -s fid_gt3 'bash $gt_dir/fid_ring_radius_gt3.sh'

tmux new-session -d -s fid_gt4 'bash $gt_dir/fid_ring_radius_gt4.sh'

#-----------
gen_dir="/data/varlamov_a_data/tree-ring-watermark/scripts/fig_radius_gen"

tmux new-session -d -s fid_gen1 'bash $gen_dir/'

tmux new-session -d -s fid_gen2 ''

tmux new-session -d -s fid_gen3 ''

tmux new-session -d -s fid_gen4 ''