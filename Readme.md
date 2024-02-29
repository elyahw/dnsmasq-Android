# Build using NDK:
### 1. Download and extract NDK zip: (no installation needed)

### 2. Run:
export NDK_PROJECT_PATH=/home/elias/Library/Projects/dnsmasq-Android/android-ndk-r26b/

export ANDROID_NDK=/home/elias/Library/Engineering/manuals/Android/dnsmasq/android-ndk-r26b/
export PATH=$ANDROID_NDK/toolchains/llvm/prebuilt/linux-x86_64/bin:$PATH

### 3. The original make hangs, use NDK version instead:
../android-ndk-r26b/prebuilt/linux-x86_64/bin/make clean
../android-ndk-r26b/prebuilt/linux-x86_64/bin/make ARCH=arm64-v8a

#### Google repo: (does not build)
https://android.googlesource.com/platform/external/dnsmasq/

#### Official repo: (builds)
https://thekelleys.org.uk/dnsmasq/

# Sources:
https://github.com/LineageOS/android_packages_modules_DnsResolver
https://github.com/LineageOS/android_external_dnsmasq/tags
https://xdaforums.com/t/is-it-possible-to-run-dnsmasq-on-lineageos.4652441/ ***
https://xdaforums.com/t/tut-adblock-using-dnsmasq-root.3279186/
https://xdaforums.com/t/how-do-i-assign-a-permanent-static-ip-address-to-hotspot-in-android-10.4037021/

## Start it:
adb devices
adb push dnsmasq /data/local/tmp/dnsmasq
adb push dnsmasq.conf /data/local/tmp/dnsmasq.conf
adb shell 'chmod +x /data/local/tmp/dnsmasq'
adb shell 'nohup /data/local/tmp/dnsmasq >/dev/null 2>&1 &'

https://stackoverflow.com/questions/14370825/where-is-dnsmasq-conf-in-android-phone
You should just create a file called dnsmasq.pid, somewhere on your system, and give it to dnsmasq using dnsmasq --pid-file <path/to/your/dnsmasq.pid>. Be sure that dnsmasq has the rights to access this file.

# New tabs:
https://shareprogrammingtips.blogspot.com/2018/07/cross-compile-cc-based-programs-and-run.html
https://www.google.com/search?safe=strict&q=build+dnsmasq+for+android
https://github.com/Android-Apps/dnsmasq/tree/master
https://android.googlesource.com/platform/external/dnsmasq/
https://xdaforums.com/t/is-it-possible-to-run-dnsmasq-on-lineageos.4652441/
https://www.google.com/search?safe=strict&q=how+to+install+android+ndk#ip=1
https://stackoverflow.com/questions/41471000/how-to-install-ndk-with-android-sdk-manager
https://developer.android.com/tools/sdkmanager
https://www.youtube.com/watch?v=XIpCs8dWQnY
https://groovetechnology.com/blog/can-c-be-used-for-android-app-development/
https://stackoverflow.com/questions/8698798/how-to-compile-and-run-a-c-c-program-on-the-android-system
https://developer.android.com/ndk/guides
https://docs.unrealengine.com/5.0/en-US/how-to-set-up-android-sdk-and-ndk-for-your-unreal-engine-development-environment/
https://docs.unity3d.com/560/Documentation/Manual/android-sdksetup.html

# To block:
block all except defined ones. See pc's file.
