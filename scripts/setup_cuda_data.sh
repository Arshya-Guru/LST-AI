#!/bin/bash
# Creates the nvvm/libdevice directory structure that TensorFlow XLA expects.
# Triton (pulled in by torch) ships libdevice.10.bc but not in the standard
# CUDA layout, so TF can't find it. This script bridges that gap dynamically
# at pixi activation time — no hardcoded paths.

CUDA_DATA_DIR="${PIXI_PROJECT_ROOT}/LST_AI/.cuda_data/nvvm/libdevice"

# Already set up from a previous activation — nothing to do
if [ -f "${CUDA_DATA_DIR}/libdevice.10.bc" ]; then
    return 0 2>/dev/null || exit 0
fi

# Search the pixi env for the file (works regardless of Python version)
LIBDEVICE=$(find "${CONDA_PREFIX}" -name "libdevice.10.bc" -print -quit 2>/dev/null)

if [ -n "${LIBDEVICE}" ]; then
    mkdir -p "${CUDA_DATA_DIR}"
    ln -sf "${LIBDEVICE}" "${CUDA_DATA_DIR}/libdevice.10.bc"
fi
