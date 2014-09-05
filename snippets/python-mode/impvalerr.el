# -*- mode: snippet; require-final-newline: nil -*-
# name: impvalerr
# key: impvalerr
# --
try:
    from $1 import ${2:module}
except ValueError:
    import $2