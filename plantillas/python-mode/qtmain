# -*- mode: snippet; require-final-newline: nil -*-
# name: Código de aplicación Qt Principal
# key: qtmain
# --
from src import ui
from PySide import QtGui
import sys

app = QtGui.QApplication(sys.argv)
app.setApplicationName("${1:appname}")

$1 = ui.Ui()
$1.show()

app.exec_()