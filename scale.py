#!/usr/bin/python3
import io
import os
import yaml

import RPi.GPIO as GPIO  # import GPIO
from hx711 import HX711

dirname = os.path.dirname(__file__)
class Scale():
    def __init__(self):
        GPIO.setmode(GPIO.BCM)
        with open(os.path.join(dirname, 'config.yaml'), 'r') as stream:
            self.config = yaml.safe_load(stream)

    def measure(self, number):
        hx711 = HX711(
            dout_pin=self.config['sensors'][number]['dout'], #21
            pd_sck_pin=self.config['sensors'][number]['sck'], #20
        )

        hx711.reset()
        hx711._offset_A_128 = self.config['sensors'][number]['offset'] #-288343
        hx711.set_scale_ratio(self.config['sensors'][number]['ratio'])
        # hx711.set_scale_ratio(21.636875)
        return hx711.get_weight_mean(99)