#!/bin/bash
#
# Test LST-AI on sub-004 using T1w + FLAIR
#

set -e

SCRIPT_DIR="$(cd "$(dirname "$0")" && pwd)"
SUBJECT_DIR="${SCRIPT_DIR}/../bids_baseline/sub-004/anat"
OUTPUT_DIR="${SCRIPT_DIR}/../lst_test_004"
TEMP_DIR="${OUTPUT_DIR}/temp"

T1="${SUBJECT_DIR}/sub-004_acq-MPRAGE_run-01_T1w.nii.gz"
FLAIR="${SUBJECT_DIR}/sub-004_run-01_FLAIR.nii.gz"

mkdir -p "$OUTPUT_DIR" "$TEMP_DIR"

echo "=== LST-AI Test Run: sub-004 ==="
echo "T1:     $T1"
echo "FLAIR:  $FLAIR"
echo "Output: $OUTPUT_DIR"
echo "Temp:   $TEMP_DIR"
echo ""

pixi run -m "$SCRIPT_DIR" lst --t1 "$T1" --flair "$FLAIR" --output "$OUTPUT_DIR" --temp "$TEMP_DIR" --device 0
