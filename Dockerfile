FROM fedora:39

RUN dnf -y install 'dnf-command(config-manager)'
RUN dnf config-manager --add-repo https://developer.download.nvidia.com/compute/cuda/repos/fedora39/x86_64/cuda-fedora39.repo
RUN dnf clean all
RUN dnf -y upgrade
RUN dnf -y install cuda-toolkit-12-6 @development-tools
RUN dnf -y module install nvidia-driver:open-dkms

WORKDIR /usr/src/tk
COPY . .
ENTRYPOINT ["/bin/bash"]