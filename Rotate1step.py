from adafruit_motorkit import MotorKit
from adafruit_motor import stepper
import time

motor_dir = 1
dir_num = 0
kit = MotorKit()
for i in range (50):
    time.sleep(2) 
    dir_num += 1
    if dir_num > 5:
        dir_num = 0
        motor_dir = motor_dir * -1

    for j in range(30):
        time.sleep(.01)
        if motor_dir == 1:
            kit.stepper1.onestep(style=stepper.DOUBLE, direction=stepper.FORWARD)
        else:
            kit.stepper1.onestep(style=stepper.DOUBLE, direction=stepper.BACKWARD)
