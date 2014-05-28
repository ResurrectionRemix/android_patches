#!/bin/bash

# No scrollback buffer
echo -e '\0033\0143'


# Specify colors for shell
txtbld=$(tput bold)             # Bold
bldgrn=${txtbld}$(tput setaf 2) # Bold green
bldblu=${txtbld}$(tput setaf 4) # Bold blue
bldcya=${txtbld}$(tput setaf 6) # Bold cyan
normal='tput sgr0'


# Initialize
top_path="$( cd .. && pwd )"
cd devices
devices_list=(*.sh "EXIT")


# Device list
echo -e "${bldgrn}  #### Device list ####"
echo ""
i=1
for device in "${devices_list[@]}";do
    echo -e "${bldblu}  $i. $(echo $device | cut -d . -f 1)"
    let i=$i+1
done


echo ""
echo ""


# Device selection
read -p "${bldcya}  Choose your device: $($normal)" option
device="$(echo ${devices_list[(($option-1))]} | cut -d . -f 1)"


# User decided to exit
if [ $device == "EXIT" ];then
    echo ""
    echo ""
    echo "${bldgrn}  Bye!"
    echo ""
    echo ""
    return 1
fi


# Clear terminal
clear


# Applying patches
echo ""
echo ""
echo -e "${bldgrn}  #### Applying patches for $device ####"
echo ""
echo ""
. "$device.sh"
echo ""
echo ""
echo -e "${bldgrn} Patching done."
echo ""
echo ""


# Back to top
cd $top_path


# Switch terminal back to normal
$normal
