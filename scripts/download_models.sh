# scripts/download_models.sh
#!/bin/bash
# Downloads LST-AI model weights, atlas, and binaries if not already present.

set -e

DATA_DIR="${PIXI_PROJECT_ROOT}/LST_AI"
ATLAS_DIR="${DATA_DIR}/atlas"
BINARY_DIR="${DATA_DIR}/binaries"
MODEL_DIR="${DATA_DIR}/model"

# Skip if all three directories already exist
if [ -d "$ATLAS_DIR" ] && [ -d "$BINARY_DIR" ] && [ -d "$MODEL_DIR" ]; then
    echo "LST-AI data already present — skipping download."
    exit 0
fi

echo "Downloading LST-AI model weights and data..."
ZIP_PATH="${DATA_DIR}/lst_data.zip"
wget -q --show-progress -O "$ZIP_PATH" \
    "https://github.com/CompImg/LST-AI/releases/download/v1.1.0/lst_data.zip"

echo "Extracting..."
unzip -qo "$ZIP_PATH" -d "$DATA_DIR"
rm -f "$ZIP_PATH"

echo "LST-AI data ready."