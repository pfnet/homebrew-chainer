# homebrew-chainer
Chainer homebrew tap repository for Mac OS X

- Current chainer version: v1.0.0

### Requirements

- Mac OS X (tested only with Yosemite)
- homebrew 0.9.5+

### Install

    > brew tap pfnet/chainer
    > brew install chainer

### Experimental (with CUDA)

- CUDA 6.5 or 7.0 (nVidia GPU required)

  - SET $CUDA_ROOT in your environment, like:

    > export CUDA_ROOT=/usr/local/cuda/

### Install (with CUDA)

    > brew tap pfnet/chainer
    > brew install chainer --enable-cuda

Note: Installation with CUDA on homebrew is experimental (Success/failure report is welcome). CUDA does NOT work for Mac with non-nVidia GPUs, including MacBook Air and latest ones with AMD GPU.