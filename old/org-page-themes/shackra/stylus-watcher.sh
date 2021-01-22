#!/usr/bin/sh

if [ "$1" = "compile" ]; then
    stylus ./etc/stylus/mi-estilo.styl -o ./resources/css/
else
    stylus ./etc/stylus/mi-estilo.styl -w -o ~/.emacs.d/owp-temp.d/El\ blog\ de\ Shackra/test/media/css/
fi
