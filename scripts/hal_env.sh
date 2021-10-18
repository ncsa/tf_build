source ~/conda.sh
CONDA_PREFIX=$(readlink -f ./venv)
conda activate ${CONDA_PREFIX}

module load cuda/11.4.48

export Cluster="HAL"

export CUDA_DIR=$(readlink -f ${CUDAPATH}/..)
export GCC_INSTALL_DIR=/usr

# Both CUDNN and CUDA are installed correctly on HAL.

export CUDNN_DIR=${CUDA_DIR}

export CC_OPT_FLAGS="-mcpu=power9 -O3"
export wheel_arch_suffix="ppc64le"
