#!/usr/bin/env bash
set -eu
title="Jaeho Shin at Stanford"

cd "$(dirname "$0")"
{
echo '<!DOCTYPE html>'
echo '<html><head><meta charset="utf-8"><title>'"$title"'</title>'
cat HEADER.html
echo '</head><body>'
marked index.md
echo '</body></html>'
} >index.html
