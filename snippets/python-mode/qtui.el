# -*- mode: snippet; require-final-newline: nil -*-
# name: Código Qt para el archivo src/ui.py
# key: qtui
# --
from PySide import QtGui
import ${1:main_interface_ui} as ${2:mainui}


class Ui(QtGui.QMainWindow, $2.Ui_MainWindow):

    def __init__(self, parent=None):
        super(Ui, self).__init__(parent)
        self.setupUi(self)
        self.move(QtGui.QApplication.desktop().screen()
                  .rect().center() - self.rect().center())
        