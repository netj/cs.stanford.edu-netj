#!/usr/bin/env bash
set -eu
title="Jaeho Shin at Stanford"

name=${1:-index}

cd "$(dirname "$0")"
{
echo '<!DOCTYPE html>'
echo '<html><head><meta charset="utf-8"><title>'"$title"'</title>'
cat HEADER.html
echo '</head><body><section>'
marked index.md
echo '</section>'
cat FOOTER.html
echo '</body></html>'
} >$name.html
