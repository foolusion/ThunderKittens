FROM fedora:39

RUN dnf -y install 'dnf-command(config-manager)'
RUN dnf config-manager --add-repo https://developer.download.nvidia.com/compute/cuda/repos/fedora39/x86_64/cuda-fedora39.repo
RUN dnf clean all
RUN dnf -y upgrade
RUN dnf -y install cuda-toolkit-12-6 @development-tools
RUN dnf -y module install nvidia-driver:open-dkms
ENV PATH=/usr/local/cuda-12.6/bin:$PATH
ENV LD_LIBRARY_PATH=/usr/local/cuda-12.6/lib64:$LD_LIBRARY_PATH

WORKDIR /usr/src/tk
COPY . .
ENTRYPOINT ["/bin/bash"]
