#!/bin/sh

set -e
set -x

for f in test-*.j; do
    pjass common.j blizzard.j war3map.j "$f"
done

jhcr init common.j blizzard.j war3map.j

for f in test-*.j; do
    jhcr update --preload-path ~/Library/Application\ Support/Blizzard/Warcraft\ III/CustomMapData/ "$f"
done

mpq add base.w3x jhcr_war3map.j --name war3map.j
wc3 "$(realpath base.w3x)"


