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
perl >$name.md.tmp -Mstrict -e '
    my $md = join "", <>;
    while ($md =~ /(.*?)<\$(.*?)\$>|(.*)$/sg) {
        print $1;
        my $out = `$2`;
        chomp $out;
        print $out;
        print $3;
    }
' <index.md
marked $name.md.tmp
echo '</section>'
cat FOOTER.html
echo '</body></html>'
} >$name.html
echo Published $name.html
