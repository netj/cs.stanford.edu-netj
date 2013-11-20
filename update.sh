#!/usr/bin/env bash
set -eu
title="Jaeho Shin at Stanford"

[ -x buildkit/compile-xdocs ] ||
    git submodule update --init

name=${1:-index}

cd "$(dirname "$0")"
{
echo '<!DOCTYPE html>'
echo '<html><head><meta charset="utf-8"><title>'"$title"'</title>'
cat HEADER.html
echo '</head><body lang="en"><section>'
{
    buildkit/compile-xdocs |
    marked
} <index.md
echo '</section>'
cat FOOTER.html
echo '</body></html>'
} >$name.html
echo Published $name.html
