#!/bin/bash

# Colorize and add text parameters
red=$(tput setaf 1)             #  red
grn=$(tput setaf 2)             #  green
cya=$(tput setaf 6)             #  cyan
txtbld=$(tput bold)             # Bold
bldred=${txtbld}$(tput setaf 1) #  red
bldgrn=${txtbld}$(tput setaf 2) #  green
bldblu=${txtbld}$(tput setaf 4) #  blue
bldcya=${txtbld}$(tput setaf 6) #  cyan
txtrst=$(tput sgr0)             # Reset

THREADS="$1"

# Build Date/Version
VERSION=`date +%Y%m%d`


# Time of build startup
res1=$(date +%s.%N)


echo -e  ${bldblue}"       "                    
echo -e  " 0000000000 00000000    0000       0000      000    00   00000000  00       0000000   0000000"
echo -e  "     00     00     00    00       00  00     0000   00  00         00       00       00      "
echo -e  "     00     00000000     00      00    00    00 00  00 00   00000  00       0000000   000000 "
echo -e  "     00     00    00     00     0000000000   00  00 00 00       00 00       00             00"
echo -e  "     00     00     00    00    00        00  00   0000  00      00 00       00             00"
echo -e  "     00     00      00  0000  00          00 00    000   00000000  00000000 0000000   000000 "
echo -e
echo -e "${bldgrn}Team Triangles ReleaseBuild Mode: LG Devices"
echo -e "${bldcya}mako, hammerhead, gee, e980, p990";
echo -e ""

# setup environment
echo -e "${bldblu}Please wait, Setting up build environment${txtrst}"
. build/envsetup.sh

# make destination folder
echo -e "${bldblu}Creating Destination Folder.${txtrst}"
mkdir Masterbuild_Output

# build device
echo -e ""
echo -e "${bldcya}Starting ReleaseBuild${txtrst}"
echo -e ""
echo -e "${bldvya}Starting build for LG Nexus 4${txtrst}"
lunch "triangles_mako-userdebug";
brunch "triangles_mako-userdebug" -j"$THREADS"
cp out/target/product/mako/TRIANGLES-4.4.4-mako-DEVELOPER_BUILD-v2.0-$VERSION.zip ./Masterbuild_Output
res2=$(date +%s.%N)

echo -e ""
echo -e "${bldvya}Starting build for LG Nexus 5${txtrst}"
lunch "triangles_hammerhead-userdebug";
brunch "triangles_hammerhead-userdebug" -j"$THREADS"
cp out/target/product/hammerhead/TRIANGLES-4.4.4-hammerhead-DEVELOPER_BUILD-v2.0-$VERSION.zip ./Masterbuild_Output
res3=$(date +%s.%N)

echo -e ""
echo -e "${bldvya}Starting build for LG Optimus G${txtrst}"
lunch "triangles_gee-userdebug";
brunch "triangles_gee-userdebug" -j"$THREADS"
cp out/target/product/gee/TRIANGLES-4.4.4-gee-DEVELOPER_BUILD-v2.0-$VERSION.zip ./Masterbuild_Output
res4=$(date +%s.%N)

echo -e ""
echo -e "${bldvya}Starting build for LG Optimus G Pro${txtrst}"
lunch "triangles_e980-userdebug";
brunch "triangles_e980-userdebug" -j"$THREADS"
cp out/target/product/e980/TRIANGLES-4.4.4-e980-DEVELOPER_BUILD-v2.0-$VERSION.zip ./Masterbuild_Output
res5=$(date +%s.%N)

echo -e ""
echo -e "${bldvya}Starting build for LG Optimus 2X${txtrst}"
lunch "triangles_p990-userdebug";
brunch "triangles_p990-userdebug" -j"$THREADS"
cp out/target/product/p990/TRIANGLES-4.4.4-p990-DEVELOPER_BUILD-v2.0-$VERSION.zip ./Masterbuild_Output
res6=$(date +%s.%N)

# finished? get elapsed time

echo "${bldblu}ReleaseBuild for LG Device : Complete.
echo "${bldgrn}LG Nexus 4 (mako) : ${txtrst}${grn}$(echo "($res2 - $res1) / 60"|bc ) minutes ($(echo "$res2 - $res1"|bc ) seconds) ${txtrst}"
echo "${bldgrn}LG Nexus 5 (hammerhead) : ${txtrst}${grn}$(echo "($res3 - $res2) / 60"|bc ) minutes ($(echo "$res3 - $res2"|bc ) seconds) ${txtrst}"
echo "${bldgrn}LG Optimus G (gee) : ${txtrst}${grn}$(echo "($res4 - $res3) / 60"|bc ) minutes ($(echo "$res4 - $res3"|bc ) seconds) ${txtrst}"
echo "${bldgrn}LG Optimus G Pro (e980) : ${txtrst}${grn}$(echo "($res5 - $res4) / 60"|bc ) minutes ($(echo "$res5 - $res4"|bc ) seconds) ${txtrst}"
echo "${bldgrn}LG Optimus 2X (p990) : ${txtrst}${grn}$(echo "($res6 - $res5) / 60"|bc ) minutes ($(echo "$res6 - $res5"|bc ) seconds) ${txtrst}"
echo "${bldcya}Total Time: ${txtrst}${cya}$(echo "($res6 - $res1) / 60"|bc ) minutes ($(echo "$res8 - $res1"|bc ) seconds) ${txtrst}"
cd Masterbuild_Output
ls
cd ..
