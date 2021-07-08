#!/bin/bash
. halium.env
cd $ANDROID_ROOT
. build/envsetup.sh
bash hybris-patches/apply-patches.sh --mb
export USE_CCACHE=1
breakfast $DEVICE
mka -j 4 mkbootimg
mka -j 4 fec
mka -j 4 halium-boot
mka -j 4 systemimage
