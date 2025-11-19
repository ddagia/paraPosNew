#!/usr/bin/env sh

echo "$1" | sed -e 's/\[\([^]]*\)\]/(\1)/g' | sed -e ':a;N;$!ba;s/\n/ /g;s/\[\(.*\)\]/(\1)/g' | wl-copy


