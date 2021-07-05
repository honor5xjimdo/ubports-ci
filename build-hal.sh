#!/bin/bash
source halium.env
cd $ANDROID_ROOT


source build/envsetup.sh
bash hybris-patches/apply-patches.sh --mb
export USE_CCACHE=1
breakfast $DEVICE
make -j128 mkbootimg
make -j128 fec
make -j128 halium-boot

bash hybris-patches/apply-patches.sh --mb
#touch /home/runner/work/halium/out/soong/.intermediates/frameworks/base/packages/EasterEgg/EasterEgg/android_common/dex/EasterEgg.jar
make -j128 systemimage 

echo "md5sum halium-boot.img and system.img"
#md5sum $ANDROID_ROOT/out/target/product/kiwi/halium-boot.img
#md5sum $ANDROID_ROOT/out/target/product/kiwi/system.img
