# Specify colors for shell
txtbld=$(tput bold)             # Bold
bldgrn=${txtbld}$(tput setaf 2) # Bold green
bldblu=${txtbld}$(tput setaf 4) # Bold blue
bldcya=${txtbld}$(tput setaf 6) # Bold cyan
normal='tput sgr0'

# Initialize
top_path="$( cd .. && pwd )"
if [ $# == 1 ];then
    device=$1
else
    # Device list
    echo -e "${bldgrn}  #### Device list ####"
    echo ""
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
fi
cd $device
patches=(*.patch)
cd ..


# Clear terminal
clear

# Reverting patches
echo -e ""
echo -e ""
echo -e "${bldgrn}  #### Reverting patches for $device ####"
echo -e ""
for patch in "${patches[@]}";do
    patch_dest="$(echo $patch | cut -d. -f1 | sed 's:_:/:g' | sed 's/@/_/g')"
    cd $top_path/$patch_dest
    echo -e "${bldblu}  Reverting $patch_dest patch .."
    $normal
    git checkout .
done
cd $top_path
echo -e ""
echo -e "${bldgrn}  Done."
echo -e ""
echo -e ""

# Switch terminal back to normal
$normal
