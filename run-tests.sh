#!/bin/sh

set -e

wc3(){
    /Applications/Warcraft\ III/_retail_/x86_64/Warcraft\ III.app/Contents/MacOS/Warcraft\ III -launch -nowfpause -windowmode windowed -width 1024 -height 768 -loadfile "$1"
}

for f in test-*.j; do
    pjass common.j blizzard.j war3map.j "$f"
done

jhcr init common.j blizzard.j war3map.j

pjass common.j blizzard.j jhcr_war3map.j

for f in test-*.j; do
    jhcr update --autoclean --preload-path ~/Library/Application\ Support/Blizzard/Warcraft\ III/CustomMapData/ "$f"
done

mpq add base.w3x jhcr_war3map.j --name war3map.j
wc3 "$(realpath base.w3x)"


