#    Android Patches Script
#
#    Copyright (C) 2014 Tano Abeleyra (@t4n017)
#
#    This program is free software: you can redistribute it and/or modify
#    it under the terms of the GNU General Public License as published by
#    the Free Software Foundation, either version 3 of the License, or
#    any later version.
#
#    This program is distributed in the hope that it will be useful,
#    but WITHOUT ANY WARRANTY; without even the implied warranty of
#    MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
#    GNU General Public License for more details.
#
#    You should have received a copy of the GNU General Public License
#    along with this program.  If not, see <http://www.gnu.org/licenses/>.


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
devices_list=(*/ "EXIT")

echo -e "${bldgrn}  #### Device list ####"
echo ""


# Device list
i=1
for device in "${devices_list[@]}";do
    echo -e "${bldblu}  $i. $(echo $device | cut -d / -f 1)"
    let i=$i+1
done

echo ""
echo "${bldgrn}  #####################"
echo ""


# Device selection
read -p "${bldcya}  Choose your device: $($normal)" option
device=${devices_list[(($option-1))]}


# User decided to exit
if [ $device == "EXIT" ];then
    echo ""
    echo ""
    echo "${bldgrn}  Bye!"
    echo ""
    echo ""
    return 0
fi


# Clear terminal
clear


# Applying patches
cd $device
patches_path=$( pwd )
patches=(*.patch)

echo -e ""
echo -e ""
echo -e "${bldgrn}  #### Applying patches for $(echo $device | cut -d / -f 1) ####"
echo -e ""
echo -e ""

sleep 2s

for patch in "${patches[@]}";do
    patch_dest="$(echo $patch | cut -d. -f1 | sed 's:_:/:g' | sed 's/@/_/g')"
    cp $patch $top_path/$patch_dest
    cd $top_path/$patch_dest
    echo -e "${bldblu}  Patching $patch_dest .."
    $normal
    git checkout .
    patch -N -p1 < $patch
    rm $patch
    cd $patches_path
    echo -e ""
done


# Back to top of patches folder
cd ..

echo -e ""
echo -e "${bldgrn}  Patching complete.\n  Review to see if no errors were there.."
echo -e ""
read -p "${bldcya}  Do you want to revert patches?[y/n]:  $($normal)" option
echo -e ""
echo -e

if [ $option == "n" ];then
    echo -e "${bldgrn}  Patches won't be reverted\n  You should use the revert script before next repo sync."
    cd $top_path
    echo -e ""
    echo -e ""
else
    # Reverting patches
    ./revert.sh $device
    cd $top_path
    echo -e ""
    echo -e ""
fi


# Switch terminal back to normal
$normal
