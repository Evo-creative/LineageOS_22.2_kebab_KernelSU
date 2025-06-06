#!/bin/bash

export SUBARCH=arm64
export PATH="/home/evo/work/Lineage-Oplus-sm8250/android-ndk-r27c/toolchains/llvm/prebuilt/linux-x86_64/bin:$PATH"

make mrproper
rm -rf out/
args=(
    -j$(nproc --all)
    O=out
    CC=clang
    ARCH=arm64
    CLANG_TRIPLE=aarch64-linux-gnu-
    CROSS_COMPILE=aarch64-linux-gnu-
    CROSS_COMPILE_COMPAT=arm-linux-gnueabi-
    LLVM=1
    LLVM_IAS=1
)

make "${args[@]}" vendor/kona-perf_defconfig
make "${args[@]}"
