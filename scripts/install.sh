set -e

CUR_DIR=$(pwd)

# Install CUDNN
if [ ! -e ${CUDNN_DIR}/include/cudnn_version.h ]; then
    . scripts/cudnn.sh
fi;

# Install tensorflow
# Target product directory
product_directory=build_py38_np1.19

#tensorflow_wheel="tensorflow-2.5.0-cp39-cp39-linux_${wheel_arch_suffix}.whl"
tensorflow_wheel="tensorflow-2.5.0-cp38-cp38-linux_${wheel_arch_suffix}.whl"

#tensorflow_optimization_wheel="tensorflow_model_optimization-0.5.1.dev0-py2.py3-none-any.whl"

pip install tensorflow_products/${product_directory}/${tensorflow_wheel}
#pip install tensorflow_products/${product_directory}/${tensorflow_optimization_wheel}
tar -C ${CONDA_PREFIX} -xzf tensorflow_products/${product_directory}/libtensorflow.tar.gz
#tar -C ${CONDA_PREFIX} -xzf tensorflow_products/libtensorflowlite.tar.gz

# Install pycocoapi
cd cocoapi/PythonAPI
make install

cd ${CUR_DIR}

# Link GPU headers
module_dir=$(pip show tensorflow | grep Location: | awk '{ print $2 }')
gpu_include_dir=${module_dir}/tensorflow/include/third_party/gpus/
if [ ! -e ${gpu_include_dir} ]; then
    mkdir ${gpu_include_dir}
    ln -s ${CUDA_DIR} ${gpu_include_dir}/cuda
fi;

# Install tensorflow_datasets needed for testing installation
pip install tensorflow_datasets
