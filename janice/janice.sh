#!/bin/sh

# Initialize
build_path="$( cd ../.. && pwd )"
patches_path="$build_path/patches/$device"
patches=(*.patch)

# Copying patches to right folders
for patch in "${patches[@]}";do
	patch_dest="$(echo $patch | cut -d. -f1 | sed 's:_:/:g')"
	cp $patch $build_path/$patch_dest
done

echo -e ""
echo -e ""
echo -e "Applying patches for $device..."
echo -e ""
echo -e ""

echo -e ""
echo -e ""
echo -e "Fixing ART..."
echo -e ""
echo -e ""
cd "$build_path/art"
git checkout .
patch -p1 < art.patch

echo -e ""
echo -e ""
echo -e "Patching complete... Review to see if no errors were there.."
echo -e ""
read -p "Press ENTER to continue..."
echo -e ""
echo -e ""


#./build-rr.sh
