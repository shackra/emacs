#!/usr/bin/env sh

set -e
#set -x

our_pip=`which pip`

if [ -x "$(command -v asdf)" ]; then
    our_pip=`asdf which pip`
fi

$our_pip install -U "python-lsp-server[all]" pylsp-mypy pyls-isort python-lsp-black pyls-memestra pylsp-rope python-lsp-ruff
