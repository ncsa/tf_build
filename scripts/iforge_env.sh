source ~/conda.sh
CONDA_PREFIX=$(readlink -f ./venv)
conda activate ${CONDA_PREFIX}

module load gcc/8.3.0
module load cuda-11.4

export Cluster="Iforge"

export CUDA_DIR="/usr/local/cuda-11.4"
# For CuDNN
export CUDNN_DIR=${CONDA_PREFIX}
export LD_LIBRARY_PATH=${LD_LIBRARY_PATH}:${CONDA_PREFIX}/lib64

# For CUPTI/TensorRT
#export LD_LIBRARY_PATH=${LD_LIBRARY_PATH}:/opt/cuda/extras/CUPTI/lib64:/opt/TensorRT-8.0.0.3/lib:/opt/cuda/lib64
export LD_LIBRARY_PATH=${LD_LIBRARY_PATH}:${CUDA_DIR}/extras/CUPTI/lib64:${CUDA_DIR}/lib64

export CC_OPT_FLAGS="-march=skylake-avx512 -O3"
export wheel_arch_suffix="x86_64"

export SCRATCH_DIR=/scratch/users/mkrafcz2
export COCO_DIR=${SCRATCH_DIR}/COCO
export IMAGENET_DIR=${SCRATCH_DIR}/ImageNet

export MODEL_DIR=${SCRATCH_DIR}/deeplab2_model_dir
