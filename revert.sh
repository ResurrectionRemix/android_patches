# Specify colors for shell
txtbld=$(tput bold)             # Bold
bldgrn=${txtbld}$(tput setaf 2) # Bold green
bldblu=${txtbld}$(tput setaf 4) # Bold blue
bldcya=${txtbld}$(tput setaf 6) # Bold cyan
normal='tput sgr0'

# Initialize
if [ $# == 1 ];then
    device=$1
    cd $device
    patches=(*.patch)
    cd ..
fi
top_path="$( cd .. && pwd )"


# Clear terminal
clear

# Reverting patches
echo -e ""
echo -e ""
echo -e "${bldgrn}  #### Reverting patches ####"
echo -e ""

if [ $# == 1 ];then
    # User decided to revert patches after they were applied
    for patch in "${patches[@]}";do
        patch_dest="$(echo $patch | cut -d. -f1 | sed 's:_:/:g' | sed 's/@/_/g')"
        cd $top_path/$patch_dest
        echo -e "${bldblu}  Reverting $patch_dest patch .."
        $normal
        git checkout .
    done
else
    # Revert each project (useful before repo sync)
    echo -e "${bldblu}  Patches are beeing reverted .."
    echo -e "${bldblu}  (it may take some seconds, relax)"
    $normal
    repo forall -vc 'git checkout .' 2> pathSpecs.error
    rm pathSpecs.error
fi
cd $top_path
echo -e ""
echo -e "${bldgrn}  Done."
echo -e ""
echo -e ""

# Switch terminal back to normal
$normal
