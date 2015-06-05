# homebrew-chainer
Chainer homebrew tap repository for Mac OS X

- Current chainer version: 0.0.0 (HEAD)

### Requirements

- Mac OS X (only supported with Yosemite)
- homebrew

### Install

    > brew tap pfnet/chainer
    > brew install chainer --HEAD

### Optional (with CUDA)

- CUDA 6.5 or 7.0 (nVidia GPU required)

### Install (with CUDA)

    > brew tap pfnet/chainer
    > brew install chainer --HEAD --enable-cuda

Note: CUDA does NOT work for Mac with non-nVidia GPUs, including MacBook Air and latest ones with AMD GPU.