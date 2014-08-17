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
echo -e "${bldgrn}Team Triangles Release Build Mode: Samsung Devices"
echo -e "${bldcya}i9100, i9300, jalte, ks01lte, t0lte, hlte, maguro, crespo";
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
echo -e "${bldvya}Starting build for Samsung Galaxy S2 (i9100)${txtrst}"
lunch "triangles_i9100-userdebug";
brunch "triangles_i9100-userdebug" -j"$THREADS"
cp out/target/product/i9100/TRIANGLES-4.4.4-i9100-DEVELOPER_BUILD-v2.0-$VERSION.zip ./Masterbuild_Output
res2=$(date +%s.%N)

echo -e ""
echo -e "${bldvya}Starting build for Samsung Galaxy S3 (i9300)${txtrst}"
lunch "triangles_i9300-userdebug";
brunch "triangles_i9300-userdebug" -j"$THREADS"
cp out/target/product/i9300/TRIANGLES-4.4.4-i9300-DEVELOPER_BUILD-v2.0-$VERSION.zip ./Masterbuild_Output
res3=$(date +%s.%N)

echo -e ""
echo -e "${bldvya}Starting build for Samsung Galaxy S4 (jalte)${txtrst}"
lunch "triangles_jalte-userdebug";
brunch "triangles_jalte-userdebug" -j"$THREADS"
cp out/target/product/jalte/TRIANGLES-4.4.4-jalte-DEVELOPER_BUILD-v2.0-$VERSION.zip ./Masterbuild_Output
res4=$(date +%s.%N)

echo -e ""
echo -e "${bldvya}Starting build for Samsung Galaxy S4 LTE-A (ks01lte)${txtrst}"
lunch "triangles_ks01lte-userdebug";
brunch "triangles_ks01lte-userdebug" -j"$THREADS"
cp out/target/product/ks01lte/TRIANGLES-4.4.4-ks01lte-DEVELOPER_BUILD-v2.0-$VERSION.zip ./Masterbuild_Output
res5=$(date +%s.%N)

echo -e ""
echo -e "${bldvya}Starting build for Samsung Galaxy Note 2 (t0lte)${txtrst}"
lunch "triangles_t0lte-userdebug";
brunch "triangles_t0lte-userdebug" -j"$THREADS"
cp out/target/product/t0lte/TRIANGLES-4.4.4-t0lte-DEVELOPER_BUILD-v2.0-$VERSION.zip ./Masterbuild_Output
res6=$(date +%s.%N)

echo -e ""
echo -e "${bldvya}Starting build for Samsung Galaxy Note 3 (hlte)${txtrst}"
lunch "triangles_hlte-userdebug";
brunch "triangles_hlte-userdebug" -j"$THREADS"
cp out/target/product/hlte/TRIANGLES-4.4.4-hlte-DEVELOPER_BUILD-v2.0-$VERSION.zip ./Masterbuild_Output
res7=$(date +%s.%N)

echo -e ""
echo -e "${bldvya}Starting build for Samsung Nexus S (crespo)${txtrst}"
lunch "triangles_crespo-userdebug";
brunch "triangles_crespo-userdebug" -j"$THREADS"
cp out/target/product/crespo/TRIANGLES-4.4.4-crespo-DEVELOPER_BUILD-v2.0-$VERSION.zip ./Masterbuild_Output
res8=$(date +%s.%N)

# finished? get elapsed time

echo "${bldblu}ReleaseBuild for Samsung Device : Complete.
echo "${bldgrn}Samsung Galaxy S2 (i9100) : ${txtrst}${grn}$(echo "($res2 - $res1) / 60"|bc ) minutes ($(echo "$res2 - $res1"|bc ) seconds) ${txtrst}"
echo "${bldgrn}Samsung Galaxy S3 (i9300) : ${txtrst}${grn}$(echo "($res3 - $res2) / 60"|bc ) minutes ($(echo "$res3 - $res2"|bc ) seconds) ${txtrst}"
echo "${bldgrn}Samsung Galaxy S4 (jalte) : ${txtrst}${grn}$(echo "($res4 - $res3) / 60"|bc ) minutes ($(echo "$res4 - $res3"|bc ) seconds) ${txtrst}"
echo "${bldgrn}Samsung Galaxy S4 LTE-A (ks01lte) : ${txtrst}${grn}$(echo "($res5 - $res4) / 60"|bc ) minutes ($(echo "$res5 - $res4"|bc ) seconds) ${txtrst}"
echo "${bldgrn}Samsung Galaxy Note 2 (t0lte) : ${txtrst}${grn}$(echo "($res6 - $res5) / 60"|bc ) minutes ($(echo "$res6 - $res5"|bc ) seconds) ${txtrst}"
echo "${bldgrn}Samsung Galaxy Note 3 (hlte) : ${txtrst}${grn}$(echo "($res7 - $res6) / 60"|bc ) minutes ($(echo "$res7 - $res6"|bc ) seconds) ${txtrst}"
echo "${bldgrn}Samsung Nexus S (crespo) : ${txtrst}${grn}$(echo "($res8 - $res7) / 60"|bc ) minutes ($(echo "$res8 - $res7"|bc ) seconds) ${txtrst}"
echo "${bldcya}Total Time: ${txtrst}${cya}$(echo "($res8 - $res1) / 60"|bc ) minutes ($(echo "$res8 - $res1"|bc ) seconds) ${txtrst}"
cd Masterbuild_Output
ls
cd ..
