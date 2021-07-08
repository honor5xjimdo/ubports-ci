#!/bin/bash
. halium.env
cd $ANDROID_ROOT
. build/envsetup.sh
#bash hybris-patches/apply-patches.sh --mb
export USE_CCACHE=1
breakfast $DEVICE
#mka -j128 mkbootimg
#mka -j128 fec
#mka -j128 halium-boot
mka -j128 systemimage
