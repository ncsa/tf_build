source ~/conda.sh
CONDA_PREFIX=$(readlink -f ./venv)
conda activate ${CONDA_PREFIX}

module load cuda/11.4.48

export SCRATCH_DIR=/home/mkrafcz2

export CUDA_DIR=$(readlink -f ${CUDAPATH}/..)
export GCC_INSTALL_DIR=/usr

# Both CUDNN and CUDA are installed correctly on HAL. (Only for cuda-11.2)

#export CUDNN_DIR=${CUDA_DIR}
export CUDNN_DIR=${CONDA_PREFIX}
export CUDNN_ARCH="ppc64le"

export CC_OPT_FLAGS="-mcpu=power9 -O3"
export wheel_arch_suffix="ppc64le"
