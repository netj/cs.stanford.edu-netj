#!/usr/bin/env bash
set -eu
title="Jaeho Shin at Stanford"

[ -x buildkit/compile-xdocs ] ||
    git submodule update --init

name=${1:-index}

cd "$(dirname "$0")"
{
echo '<!DOCTYPE html>'
echo '<html lang="en"><head><meta charset="utf-8">'
echo '<meta http-equiv="X-UA-Compatible" content="IE=edge">'
echo '<meta name="viewport" content="width=device-width, initial-scale=1">'
echo '<title>'"$title"'</title>'
cat HEADER.html
echo '</head><body lang="en"><section>'
{
    buildkit/compile-xdocs |
    ./markdown.pl
} <index.md
echo '</section>'
cat FOOTER.html
echo '</body></html>'
} >$name.html
echo Published $name.html
