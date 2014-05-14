### ANDROID PATCHES SCRIPT
##  made by t4n017
#


# No scrollback buffer
echo -e '\0033\0143'


# Specify colors for shell
red='tput setaf 1'              # red
green='tput setaf 2'            # green
yellow='tput setaf 3'           # yellow
blue='tput setaf 4'             # blue
violet='tput setaf 5'           # violet
cyan='tput setaf 6'             # cyan
white='tput setaf 7'            # white
txtbld=$(tput bold)             # Bold
bldred=${txtbld}$(tput setaf 1) # Bold red
bldgrn=${txtbld}$(tput setaf 2) # Bold green
bldblu=${txtbld}$(tput setaf 4) # Bold blue
bldcya=${txtbld}$(tput setaf 6) # Bold cyan
normal='tput sgr0'


# Initialize
top_path="$( cd .. && pwd )"
devices_list=(*/)

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
read -p "${bldred}  Choose your device: " option
device=${devices_list[(($option-1))]}


# Clear terminal
clear


# Patching
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
    git checkout .
    $normal
    patch -N -p1 < $patch
    rm $patch
    cd $patches_path
    echo -e ""
done


# Back to top of tree
cd $top_path

echo -e ""
echo -e "${bldgrn}  Patching complete.\n  Review to see if no errors were there.."
echo -e ""
echo -e ""


# Switch terminal back to normal
$normal
