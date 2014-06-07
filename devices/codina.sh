#!/bin/bash

repo="frameworks/av"
echo -e "${bldblu}  Patching $repo .."
cd $top_path/$repo
$normal
git fetch https://github.com/t4n017/android_frameworks_av.git rr
git cherry-pick cb2bed02548e460e24de7d3247ca759f3cffdd76

echo ""
echo ""

repo="frameworks/base"
echo -e "${bldblu}  Patching $repo .."
cd $top_path/$repo
$normal
git fetch https://github.com/t4n017/android_frameworks_base.git rr
git cherry-pick 92a90601b9521787d56690ecefe195b550ef2910

echo ""
echo ""

repo="frameworks/native"
echo -e "${bldblu}  Patching $repo .."
cd $top_path/$repo
$normal
git fetch https://github.com/t4n017/android_frameworks_native.git rr
git cherry-pick e0e18d96f442e6cc8e5be183085ea1249f258cd0
git cherry-pick 2702188486925b2927e7d86be6b11e12bcc569e0


echo ""
echo ""

repo="packages/services/Telephony"
echo -e "${bldblu}  Patching $repo .."
cd $top_path/$repo
$normal
git fetch https://github.com/t4n017/android_packages_services_Telephony.git rr
git cherry-pick 14ac9ccb3d6fc1bcc9ed1b7ec06dfb61e340e9ec

echo ""
echo ""

repo="system/core"
echo -e "${bldblu}  Patching $repo .."
cd $top_path/$repo
$normal
git fetch https://github.com/t4n017/android_system_core.git rr
git cherry-pick 9e22f426fd9bb345ec0a9f63e7859227d7f109eb
git cherry-pick e17ae0dd288f0ad306c00fe39e013a33ce9dce57

echo ""
echo ""

repo="system/vold"
echo -e "${bldblu}  Patching $repo .."
cd $top_path/$repo
$normal
git fetch https://github.com/t4n017/android_system_vold.git rr
git cherry-pick e27517a7cfc3dc09247e838b4b5e7d41970c50d9
