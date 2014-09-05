# -*- mode: snippet; require-final-newline: nil -*-
# name: from PySide import X
# key: pyside
# --
from PySide import ${1:$$(yas-choose-value '("QtCore" "QtGui" "QtNetwork" "QtMultimedia" "QtWebkit" "phonon"))}