from adafruit_motorkit import MotorKit
from adafruit_motor import stepper
import time

kit = MotorKit()
for i in range (50):
    time.sleep(1) 
    for j in range(90):
        kit.stepper1.onestep(style=stepper.DOUBLE)
        
