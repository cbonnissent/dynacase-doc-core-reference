#!/bin/bash 

_build=0
[ "$1" = "-n" ] && _build=1

_CONTENT="content.yml"
[ ! -f "$_CONTENT" ] && {
  echo " ** Pas de fichier $_CONTENT"
  echo " ** Lancez moi à la racine du book ! "
  exit 1
}

_CONTENTDIR="Contents"

for file in `grep content content.yml  | sed -e's,^.*content: *"\(.*\)".*$,\1,'`; do

    [ ! -f "$_CONTENTDIR/$file" ] && {
	echo " (+) new: $_CONTENTDIR/$file"
	[ $_build -eq 1 ] && {
	    [ ! -d "$_CONTENTDIR/`dirname $file`" ] && mkdir $_CONTENTDIR/`dirname $file`
	    touch  "$_CONTENTDIR/$file"
	    echo "# $file " > "$_CONTENTDIR/$file"
	    echo " " >> "$_CONTENTDIR/$file"
	    echo '<span class="fixme> template for '$file.'</span>' >> "$_CONTENTDIR/$file"
	}
    }
#    [ -f "$_CONTENTDIR/$file" ] && {
#	echo " ( ) exist: $_CONTENTDIR/$file"
#    }

done

