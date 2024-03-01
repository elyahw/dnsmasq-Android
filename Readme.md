// Build using NDK:
# 1. Download and extract NDK zip: (no installation needed)
https://developer.android.com/ndk/guides

# 2. Run:
```
export NDK_PROJECT_PATH=/home/elias/Library/Projects/dnsmasq-Android/android-ndk-r26b/
export ANDROID_NDK=/home/elias/Library/Engineering/manuals/Android/dnsmasq/android-ndk-r26b/
export PATH=$ANDROID_NDK/toolchains/llvm/prebuilt/linux-x86_64/bin:$PATH
```

# 3. The original make hangs, use NDK version instead:
```
../android-ndk-r26b/prebuilt/linux-x86_64/bin/make clean
../android-ndk-r26b/prebuilt/linux-x86_64/bin/make ARCH=arm64-v8a
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
adb shell '/data/local/tmp/dnsmasq --version'
adb push dnsmasq /data/local/tmp/dnsmasq
adb shell 'chmod +x /data/local/tmp/dnsmasq'
adb push dnsmasq.conf /data/local/tmp/dnsmasq.conf
adb shell '/data/local/tmp/dnsmasq --conf-file=/data/local/tmp/adblock.conf <&- &'
```
# error:
/system/bin/sh: /data/local/tmp/dnsmasq: not executable: 64-bit ELF file
# Solution: (not tested yet)
https://stackoverflow.com/questions/41644382/android-not-executable-64-bit-elf-file
