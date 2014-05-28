#!/bin/bash

repo="build"
echo -e "${bldblu}  Patching $repo .."
cd $top_path/$repo
$normal
git fetch https://github.com/PandaMod/android_build.git cm-11.0
git cherry-pick 2e914b2faa57a62c71a77f1f10ff9655b8f7bac4

echo ""
echo ""

repo="frameworks/av"
echo -e "${bldblu}  Patching $repo .."
cd $top_path/$repo
$normal
git fetch https://github.com/t4n017/android_frameworks_av.git kitkat
git cherry-pick 2378992ff57c858c0de9c393b3b5d8457e6cf727

echo ""
echo ""

repo="frameworks/base"
echo -e "${bldblu}  Patching $repo .."
cd $top_path/$repo
$normal
git fetch https://github.com/t4n017/android_frameworks_base.git kitkat
git cherry-pick fa8f25872cfbe681b70363323cd8b9e7f963bd42

echo ""
echo ""

repo="frameworks/native"
echo -e "${bldblu}  Patching $repo .."
cd $top_path/$repo
$normal
git fetch https://github.com/t4n017/android_frameworks_native.git kitkat
git cherry-pick 508012451a6ad9066c37845a03c7665cf43ec449

echo ""
echo ""

repo="hardware/libhardware_legacy"
echo -e "${bldblu}  Patching $repo .."
cd $top_path/$repo
$normal
git fetch https://github.com/t4n017/android_hardware_libhardware_legacy.git kitkat
git cherry-pick 144266f364254659ecf798406762fdbc9bc75d52

echo ""
echo ""

repo="packages/apps/Settings"
echo -e "${bldblu}  Patching $repo .."
cd $top_path/$repo
$normal
git fetch https://github.com/t4n017/android_packages_apps_Settings.git kitkat
git cherry-pick 6eb2671a5eae60811b39d921b5308835b81abc04

echo ""
echo ""

repo="packages/services/Telephony"
echo -e "${bldblu}  Patching $repo .."
cd $top_path/$repo
$normal
git fetch https://github.com/t4n017/android_packages_services_Telephony.git kitkat
git cherry-pick 8a5862edc9d04fed26ed3d62f50691066c24d3d0

echo ""
echo ""

repo="system/core"
echo -e "${bldblu}  Patching $repo .."
cd $top_path/$repo
$normal
git fetch https://github.com/t4n017/android_system_core.git kitkat
git cherry-pick 14bff33783923978ad77a55d71e598f0eabb0a25
git cherry-pick 7a43ef8049e87600938f64d4f241e0e5d3d282f1

echo ""
echo ""

repo="system/vold"
echo -e "${bldblu}  Patching $repo .."
cd $top_path/$repo
$normal
git fetch https://github.com/t4n017/android_system_vold.git kitkat
git cherry-pick 3af7b597586ee571d0448026050fcbfcc177f3b0
