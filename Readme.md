// Build using NDK:
# 1. Download and extract NDK zip: (no installation needed)
https://developer.android.com/ndk/guides

# 2. Run:
```
export NDK=/home/elias/Library/Projects/dnsmasq-Android/android-ndk-r26b/
export ANDROID_NDK=$NDK
export NDK_PROJECT_PATH=$NDK
export TOOLCHAIN=$NDK/toolchains/llvm/prebuilt/linux-x86_64
export PATH=$TOOLCHAIN/bin:$PATH
export TARGET=armv7a-linux-androideabi
export API=34

# new:
https://nickdesaulniers.github.io/blog/2016/07/01/android-cli/
./android-ndk-r12b/build/tools/make_standalone_toolchain.py --arch arm64 --install-dir ~/arm # see the outputs
cd ~/arm && ./bin/clang-17 test.cpp  -v

armv7a-linux-androideabi34-clang++ test.cpp

armv7a-linux-androideabi34-clang test.cpp

# sudo pacman -S aarch64-linux-gnu-binutils # how to use it? I ran `umachine` soon after it and it updated clang-17!

/home/elias/Library/Projects/dnsmasq-Android/android-ndk-r26b/build/tools/make_standalone_toolchain.py --arch arm64 --api 33

/home/elias/Library/Projects/dnsmasq-Android/android-ndk-r26b/toolchains/llvm/prebuilt/linux-x86_64/bin/armv7a-linux-androideabi34-clang test.cpp
```

# 3. The original make hangs, use NDK version instead:
```
$NDK/prebuilt/linux-x86_64/bin/make clean
$NDK/prebuilt/linux-x86_64/bin/make ARCH=arm64-v8a

$NDK/prebuilt/linux-x86_64/bin/make TARGET=arm64-v8a

$NDK/prebuilt/linux-x86_64/bin/make CC=$TOOLCHAIN/bin/$TARGET$API-clang AR=$TOOLCHAIN/bin/llvm-ar RANLIB=$TOOLCHAIN/bin/llvm-ranlib
```

# Google repo: (does not build)
https://android.googlesource.com/platform/external/dnsmasq/

# Official repo: (builds)
https://thekelleys.org.uk/dnsmasq/

# Sources:
https://xdaforums.com/t/is-it-possible-to-run-dnsmasq-on-lineageos.4652441/
https://xdaforums.com/t/tut-adblock-using-dnsmasq-root.3279186/
https://xdaforums.com/t/how-do-i-assign-a-permanent-static-ip-address-to-hotspot-in-android-10.4037021/

https://stackoverflow.com/questions/14370825/where-is-dnsmasq-conf-in-android-phone
You should just create a file called dnsmasq.pid, somewhere on your system, and give it to dnsmasq using dnsmasq --pid-file <path/to/your/dnsmasq.pid>. Be sure that dnsmasq has the rights to access this file.

# Build C++ on Android:
https://shareprogrammingtips.blogspot.com/2018/07/cross-compile-cc-based-programs-and-run.html

// Start it:
# From xdaforums:
```
adb devices
adb push dnsmasq /data/local/tmp/dnsmasq
adb push dnsmasq.conf /data/local/tmp/dnsmasq.conf
adb shell 'chmod +x /data/local/tmp/dnsmasq'
adb shell 'nohup /data/local/tmp/dnsmasq >/dev/null 2>&1 &'
```
# Modified:
```
adb shell 'rm -f /data/local/tmp/dnsmasq'
adb shell '/data/local/tmp/dnsmasq --version'
adb push dnsmasq /data/local/tmp/dnsmasq
adb shell 'ls -a1l /data/local/tmp/dnsmasq'
adb shell '/data/local/tmp/dnsmasq --version'
adb shell 'chmod +x /data/local/tmp/dnsmasq'
adb push dnsmasq.conf /data/local/tmp/dnsmasq.conf
adb shell '/data/local/tmp/dnsmasq --conf-file=/data/local/tmp/adblock.conf <&- &'
```
# error:
/system/bin/sh: /data/local/tmp/dnsmasq: not executable: 64-bit ELF file
# Solution: (not tested yet)
https://stackoverflow.com/questions/41644382/android-not-executable-64-bit-elf-file
