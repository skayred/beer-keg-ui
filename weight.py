import os
import RPi.GPIO as GPIO  # import GPIO

from PyQt5.QtQml import QQmlApplicationEngine
from PyQt5.QtWidgets import QApplication
from PyQt5.QtCore import QTimer, QObject, pyqtSignal, QVariant

from ebc import possible_colors
from backend import Backend, EMPTY_KEG_WEIGHT

dirname = os.path.dirname(__file__)

try:
    app = QApplication([])
    engine = QQmlApplicationEngine()
    # Animated version
    # engine.load(os.path.join(dirname, "weight.ui.qml"))
    # Non-animated version
    engine.load(os.path.join(dirname, "weight-plain.ui.qml"))

    backend = Backend()

    def exit():
        app.quit()
        QApplication.quit()

    def colorSelected(num, color):
        backend.state[num]['color'] = color
        backend.colored.emit(num, color)
        backend.save_config()

    def reset(number):
        backend.state[number]['max'] = backend.scale.measure(number) - EMPTY_KEG_WEIGHT
        backend.save_config()

    engine.rootObjects()[0].setProperty("backend", backend)
    engine.rootObjects()[0].setProperty("ebcColors", possible_colors)
    engine.rootObjects()[0].exitClicked.connect(exit)
    engine.rootObjects()[0].colorSelected.connect(colorSelected)
    engine.rootObjects()[0].resetClicked.connect(reset)
    backend.update_time()
    
    for i, keg in enumerate(backend.state):
        backend.colored.emit(i, keg['color'])

    app.exec()
finally:
    # Gracefully release the resources
    GPIO.cleanup()
