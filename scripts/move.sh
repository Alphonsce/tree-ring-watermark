ENV_NAME="stable_tree"

SOURCE="/data/varlamov_a_data/tree-ring-watermark/src/tree_ring_watermark/loss/losses/rgb_watson_vgg_trial0.pth"
DESTINATION="/data/varlamov_a_data/miniconda3/envs/$ENV_NAME/lib/python3.10/site-packages/tree_ring_watermark/loss/losses"

cp "$SOURCE" "$DESTINATION"


# SOURCE_FOLDER="/data/varlamov_a_data/tree-ring-watermark/stable_signature/src/ldm"
# DESTINATION_FOLDER="/data/varlamov_a_data/miniconda3/envs/$ENV_NAME/lib/python3.10/site-packages/tree_ring_watermark/"

# SOURCE_FOLDER="/data/varlamov_a_data/tree-ring-watermark/src/tree_ring_watermark/loss/losses/rgb_watson_vgg_trial0.pth"
# DESTINATION_FOLDER="/data/varlamov_a_data/dima/scripts/"

# cp -r "$SOURCE_FOLDER"/* "$DESTINATION_FOLDER"

# echo "Files copied successfully."