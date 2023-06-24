import json
import os
from PyQt5.QtCore import QTimer, QObject, pyqtSignal, QVariant

from scale import Scale

EMPTY_KEG_WEIGHT = 4450
AMOUNT = 2
UPDATE_INTERVAL_SECONDS = 60

dirname = os.path.dirname(__file__)

class Backend(QObject):
    weight = pyqtSignal([QVariant])
    colored = pyqtSignal([int, str])

    def __init__(self):
        super().__init__()

        self.scale = Scale()

        with open(os.path.join(dirname, 'state.json'), 'r') as openfile:
            self.state = json.load(openfile)

        self.timer = QTimer()
        self.timer.setInterval(UPDATE_INTERVAL_SECONDS * 1000)
        self.timer.timeout.connect(self.update_time)
        self.timer.start()

    def update_time(self):
        for i, state in enumerate(self.state):
            weight = self.scale.measure(i) - EMPTY_KEG_WEIGHT
            percentage = int(100 * weight / state['max'])

            a = {
                'number': i,
                'percentage': percentage,
                'weight': weight
            }

            self.weight.emit(a)
    
    def save_config(self):
        with open(os.path.join(dirname, 'state.json'), "w") as outfile:
            json.dump(self.state, outfile)
