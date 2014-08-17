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
echo -e "${bldgrn}Team Triangles Release Build Mode: Asus Devices"
echo -e "${bldcya}grouper, flo";
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
echo -e "${bldvya}Starting build for Asus Nexus 7 (gruper)${txtrst}"
lunch "triangles_grouper-userdebug";
brunch "triangles_grouper-userdebug" -j"$THREADS"
cp out/target/product/grouper/TRIANGLES-4.4.4-grouper-DEVELOPER_BUILD-v2.0-$VERSION.zip ./Masterbuild_Output
res2=$(date +%s.%N)

echo -e ""
echo -e "${bldvya}Starting build for Asus Nexus 7 2013 (flo)${txtrst}"
lunch "triangles_flo-userdebug";
brunch "triangles_flo-userdebug" -j"$THREADS"
cp out/target/product/flo/TRIANGLES-4.4.4-flo-DEVELOPER_BUILD-v2.0-$VERSION.zip ./Masterbuild_Output
res3=$(date +%s.%N)

# finished? get elapsed time

echo "${bldblu}ReleaseBuild for Asus Device : Complete.
echo "${bldgrn}Asus Nexus 7 (grouper) : ${txtrst}${grn}$(echo "($res2 - $res1) / 60"|bc ) minutes ($(echo "$res2 - $res1"|bc ) seconds) ${txtrst}"
echo "${bldgrn}Asus Nexus 7 2013 (flo) : ${txtrst}${grn}$(echo "($res3 - $res2) / 60"|bc ) minutes ($(echo "$res3 - $res2"|bc ) seconds) ${txtrst}"

echo "${bldcya}Total Time: ${txtrst}${cya}$(echo "($res3 - $res1) / 60"|bc ) minutes ($(echo "$res8 - $res1"|bc ) seconds) ${txtrst}"
cd Masterbuild_Output
ls
cd ..
