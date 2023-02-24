#!/bin/sh
# conda activate LFields

for NOISE_TYPE in phone additive_gaussian
do
  for SCENE in general_36 pens occlusions_5 t_rex reflective_20
  do
    for STRENGTH in soft medium hard
    do
      for METHOD in wavelets bm3d lfbm5d dncnn lfdnpatch
      do
        python main.py \
          --denoising_method $METHOD \
          --scene_name $SCENE \
          --noise_type $NOISE_TYPE \
          --input_dir "./data/noisy/${NOISE_TYPE}_${STRENGTH}/${SCENE}" \
          --output_dir "${NOISE_TYPE}_${STRENGTH}/${SCENE}/${METHOD}" \
          --quality_metric all \
          --IQA_full
      done
    done
  done
done
