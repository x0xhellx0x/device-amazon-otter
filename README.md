# CM7 for Kindle Fire

## Info

|||
|-----------------------------------:|:--------------------------|
|**Discussion and build thread** | http://forum.xda-developers.com/showthread.php?t=1508802

## Building 

### Initialize
[Get started](https://github.com/KFire-Android/android_local_manifest/wiki)

### Download sources

```bash
mkdir cm7
cd cm7/
curl https://dl-ssl.google.com/dl/googlesource/git-repo/repo > ~/repo
chmod a+x ~/repo
repo init -u git://github.com/CyanogenMod/android.git -b gingerbread
wget -O .repo/local_manifest.xml https://raw.github.com/KFire-Android/android_local_manifest/gingerbread/local_manifest.xml 
repo sync -j16
./vendor/amazon/otter/setup_vendor.sh
```

### Compile

```bash
source build/envsetup.sh
brunch otter -j$(grep -c processor /proc/cpuinfo)
```
