# Specify colors for shell
blue='tput setaf 4'             # blue
green='tput setaf 2'            # green
txtbld=$(tput bold)             # Bold
bldblu=${txtbld}$(tput setaf 4) # Bold blue
bldgrn=${txtbld}$(tput setaf 2) # Bold green
normal='tput sgr0'

# Choose device
if [ $# == 0 ]; then
  echo -e "\n\n${bldgrn}  Choose desired device\n"
  echo -e "${bldblu}  1. janice"
  echo -e "${bldblu}  2. codina"
  read device
  if [ "$device" == "1" ];then
    device="janice"
  else
    device="codina"
  fi
  echo ""
  echo ""
else
  device=$1
fi

echo ""
echo ""

# Copying vold patch
cp system_vold-swap.patch system/vold

echo -e "${bldblu}  Cherrypicking ART fix... "
$normal

cd art
git fetch https://github.com/cernekee/android_art monitor-stack-v1
git cherry-pick fc2ac71d0d9e147c607bff9371fe2ef25d8470af

echo ""
echo ""

echo -e "${bldblu}  Cherrypicking Core Patch - OMX and reboot/shutdown fix..."
$normal
cd ../system/core
git fetch https://github.com/TeamCanjica/android_system_core cm-11.0
git cherry-pick 02f79390ff2d6a0e173d1dd8bfae02844d4c33a6
git cherry-pick 910ccc43a23b042df3df12ed1bbbe32954749e59

echo ""
echo ""

echo -e "${bldblu}  Cherrypicking OMX Patch - android_frameworks_av..."
$normal
cd ../../frameworks/av
git fetch https://github.com/TeamCanjica/android_frameworks_av cm-11.0
git cherry-pick 5c4dd9cc832f47017df8930d77e2d175744af3eb

echo ""
echo ""

cd ../native

echo -e "${bldblu}  Cherrypicking OMX Patch - android_frameworks_native..."
$normal
git fetch https://github.com/TeamCanjica/android_frameworks_native cm-11.0
git cherry-pick 213b1afc3177f483598e23b9d09738d29c8129cb

echo ""
echo ""

if [ "$device" == "codina" ]; then
  echo -e "${bldblu}  Cherrypicking Legacy sensors..."
  $normal
  git fetch http://review.cyanogenmod.org/CyanogenMod/android_frameworks_native refs/changes/11/59311/1
  git cherry-pick FETCH_HEAD

  echo ""
  echo ""
fi

cd ../base

echo -e "${bldblu}  Cherrypicking \"OK Google\" patch..."
$normal
git fetch https://github.com/TeamCanjica/android_frameworks_base cm-11.0
git cherry-pick de30387b3c32c2a9cf653590c8454bd002bf0dd1

echo ""
echo ""

echo -e "${bldblu}  Cherrypicking patch to reduce SystemUI crashes and freezes..."
$normal
git fetch http://review.cyanogenmod.org/CyanogenMod/android_frameworks_base refs/changes/34/63034/3
git cherry-pick FETCH_HEAD

echo ""
echo ""

echo -e "${bldblu}  Cherrypicking vold patch..."
cd ../../system/vold
$normal
git reset --hard HEAD
git apply system_vold-swap.patch
rm system_vold-swap.patch

echo ""
echo ""

echo -e "${bldblu}  Cherrypicking vibrator fix..."
cd ../../hardware/libhardware_legacy
$normal
git fetch https://github.com/TeamCanjica/android_hardware_libhardware_legacy cm-11.0
git cherry-pick 9c2250d32a1eda9afe3b5cefe3306104148aa532

echo ""
echo ""

echo -e "${bldblu}  Cherrypicking low in-call volume fix..."
cd ../../packages/services/Telephony
$normal
git fetch https://github.com/TeamCanjica/android_packages_services_Telephony cm-11.0
git cherry-pick fdf281fdabe5e7517eb96f2faf159bbcc74ae4a6

echo ""
echo ""

if [ "$device" == "janice" ]; then
  echo -e "${bldblu}  Cherrypicking default RGB Colors fix..."
  cd ../../apps/Settings
  $normal
  git fetch https://github.com/TeamCanjica/android_packages_apps_Settings cm-11.0
  git cherry-pick 76ce30bca51cb4392d7fb4df97ea8eed27f03c2d

  echo ""
  echo ""
fi

cd ../../..
