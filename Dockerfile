FROM nvcr.io/nvidia/cuda:12.5.1-cudnn-devel-rockylinux8
RUN dnf upgrade && dnf -y install gcc-toolset-13 git python3
WORKDIR /usr/src
COPY . .
ENTRYPOINT ["/bin/bash"]