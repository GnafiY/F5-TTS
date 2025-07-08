set -euo pipefail

tasks='sim wer'
gen_wav_base_dir='results/F5TTS_v1_Base_1250000/ls_pc_test_clean'
nfes='32 16'

for task in ${tasks}; do
    for nfe in ${nfes}; do
        python src/f5_tts/eval/eval_librispeech_test_clean.py -e ${task} \
            -l en --gpu_nums 1 \
            --gen_wav_dir ${gen_wav_base_dir}/seed0_euler_nfe${nfe}_vocos_ss-1_cfg2.0_speed1.0 \
            -p $(realpath ${HOME}/datasets/LibriSpeech/LibriSpeech/test-clean)
    done
done
