# Prepare cudnn (iforge)
cudnn_pkgver1=8.2.2
cudnn_cudaver=11.4
cudnn_pkgver2=8.2.2.26
cudnn_filename=cudnn-${cudnn_cudaver}-linux-${CUDNN_ARCH}-v${cudnn_pkgver2}.tgz
if [ ! -e ${cudnn_filename} ]; then
    # Download Cudnn package
    wget "https://developer.download.nvidia.com/compute/redist/cudnn/v${cudnn_pkgver1}/${cudnn_filename}"
fi;

if [ ! -e ${CONDA_PREFIX}/include/cudnn_version.h ]; then
    # Install cudnn
    tar xvf ${cudnn_filename} -C ${CONDA_PREFIX} --strip-components 1
fi;
