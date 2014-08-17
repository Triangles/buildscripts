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

DEVICE="$1"
THREADS="$2"
CLEAN="$3"

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
echo -e "${cya}Building ${bldcya}Triangle Nightly-$VERSION ${txtrst}";
echo -e ""
echo -e ""

# setup environment
echo -e "${bldblu}Setting up build environment ${txtrst}"
. build/envsetup.sh

# lunch device
echo -e ""
echo -e "${bldblu}Lunching your device ${txtrst}"
lunch "triangles_$DEVICE-userdebug";

echo -e ""
echo -e "${bldblu}Starting Triangle build for $DEVICE ${txtrst}"

# start compilation
brunch "triangles_$DEVICE-userdebug" -j"$THREADS"
echo -e ""

# finished? get elapsed time
res2=$(date +%s.%N)
echo "Wow, that's cool! You finished building Triangles ROM Project!"
echo "${bldgrn}Total time elapsed: ${txtrst}${grn}$(echo "($res2 - $res1) / 60"|bc ) minutes ($(echo "$res2 - $res1"|bc ) seconds) ${txtrst}"
