#!/bin/sh

repo="frameworks/av"
echo -e "${bldblu}  Patching $repo .."
cd $top_path/$repo
$normal
git fetch https://github.com/TeamCanjica/android_frameworks_av cm-11.0
git cherry-pick 5c4dd9cc832f47017df8930d77e2d175744af3eb

echo ""
echo ""

repo="frameworks/base"
echo -e "${bldblu}  Patching $repo .."
cd $top_path/$repo
$normal
git fetch https://github.com/TeamCanjica/android_frameworks_base cm-11.0
git cherry-pick de30387b3c32c2a9cf653590c8454bd002bf0dd1

echo ""
echo ""

repo="frameworks/native"
echo -e "${bldblu}  Patching $repo .."
cd $top_path/$repo
$normal
git fetch https://github.com/TeamCanjica/android_frameworks_native cm-11.0
git cherry-pick 213b1afc3177f483598e23b9d09738d29c8129cb
git fetch http://review.cyanogenmod.org/CyanogenMod/android_frameworks_native refs/changes/11/59311/1
git cherry-pick FETCH_HEAD

echo ""
echo ""

repo="hardware/libhardware_legacy"
echo -e "${bldblu}  Patching $repo .."
cd $top_path/$repo
$normal
git fetch https://github.com/TeamCanjica/android_hardware_libhardware_legacy cm-11.0
git cherry-pick 9c2250d32a1eda9afe3b5cefe3306104148aa532

echo ""
echo ""

repo="packages/services/Telephony"
echo -e "${bldblu}  Patching $repo .."
cd $top_path/$repo
$normal
git fetch https://github.com/TeamCanjica/android_packages_services_Telephony cm-11.0
git cherry-pick fdf281fdabe5e7517eb96f2faf159bbcc74ae4a6

echo ""
echo ""

repo="system/core"
echo -e "${bldblu}  Patching $repo .."
cd $top_path/$repo
$normal
git fetch https://github.com/TeamCanjica/android_system_core cm-11.0
git cherry-pick 02f79390ff2d6a0e173d1dd8bfae02844d4c33a6
git cherry-pick 910ccc43a23b042df3df12ed1bbbe32954749e59

echo ""
echo ""

repo="system/vold"
echo -e "${bldblu}  Patching $repo .."
cd $top_path/$repo
$normal
git fetch https://github.com/t4n017/android_system_vold.git kitkat
git cherry-pick 3af7b597586ee571d0448026050fcbfcc177f3b0
