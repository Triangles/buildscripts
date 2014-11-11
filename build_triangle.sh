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
echo -e  " XXXXXXXXXX XXXXXXXX    XXXX       XXXX      XXX    XX   XXXXXXXX  XX       XXXXXXX   XXXXXXX"
echo -e  "     XX     XX     XX    XX       XX  XX     XXXX   XX  XX         XX       XX       XX      "
echo -e  "     XX     XXXXXXXX     XX      XX    XX    XX XX  XX XX   XXXXX  XX       XXXXXXX   XXXXXX "
echo -e  "     XX     XX    XX     XX     XXXXXXXXXX   XX  XX XX XX       XX XX       XX             XX"
echo -e  "     XX     XX     XX    XX    XX        XX  XX   XXXX  XX      XX XX       XX             XX"
echo -e  "     XX     XX      XX  XXXX  XX          XX XX    XXX   XXXXXXXX  XXXXXXXX XXXXXXX   XXXXXX "
echo -e
echo -e "${bldcya} Building Triangle Nightly-$VERSION ${txtrst}";
echo -e ""

# setup environment
echo -e "${bldblu} Setting Build Environment ${txtrst}"
. build/envsetup.sh

# lunch device
echo -e ""
echo -e "${bldblu} Lunching Device ${txtrst}"
lunch "triangles_$DEVICE-userdebug";

echo -e ""
echo -e "${bldblu} Starting Build for $DEVICE ${txtrst}"

# start compilation
brunch "triangles_$DEVICE-userdebug" -j"$THREADS"
echo -e ""

# finished? get elapsed time
res2=$(date +%s.%N)
echo "${bldgrn}TOTAL TIME: ${txtrst}${grn}$(echo "($res2 - $res1) / 60"|bc ) minutes ($(echo "$res2 - $res1"|bc ) seconds) ${txtrst}"
