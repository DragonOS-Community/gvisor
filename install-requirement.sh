#!/bin/bash

# 安装bazel-7.5.0(ubuntu)
sudo apt install apt-transport-https curl gnupg -y
curl -fsSL https://bazel.build/bazel-release.pub.gpg | gpg --dearmor >bazel-archive-keyring.gpg
sudo mv bazel-archive-keyring.gpg /usr/share/keyrings
echo "deb [arch=amd64 signed-by=/usr/share/keyrings/bazel-archive-keyring.gpg] https://storage.googleapis.com/bazel-apt stable jdk1.8" | sudo tee /etc/apt/sources.list.d/bazel.list

sudo apt update && sudo apt full-upgrade

sudo apt install bazel-7.5.0
sudo ln -s /usr/bin/bazel-7.5.0 /usr/bin/bazel

# 检查是否已安装clang
if ! command -v clang >/dev/null 2>&1; then
    # 安装clang
    wget https://apt.llvm.org/llvm.sh
    chmod +x llvm.sh
    sudo bash llvm.sh 14
else
    echo "clang 已安装"
fi

# 安装其他依赖项
sudo apt install -y libbpf-dev libc6-dev-i386 gcc-aarch64-linux-gnu g++-aarch64-linux-gnu 