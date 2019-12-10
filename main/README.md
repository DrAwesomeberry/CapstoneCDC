Required Python Packages to Run:

pysimplegui
pygame
adafruit-circuitpython-motorkit
adafruit-circuitpython-motor

These can be installed via the command:
    pip install pysimplegui adafruit-circuitpython-motorkit adafruit-circuitpython-motor pygame --user



Quick Start Guide:

1. Make sure joystick is plugged in (this will cause 'game.py' to crash)

2. Run 'menu.py'
    a. Open Terminal and use cd to navigate to main/ directory
    b. run command 'python menu.py' (might need to replace 'python' with 'python3')

3. In the new window, find 'Use Parameters from File' and click 'Browse'
    to and use 'defaults.txt' or another desired parameters file. Then click 'Load'.

4. Change any desired parameters using the menu.

5. (Optional) save current parameters to named file by typing the name in the
    'Save Current Parameters to File' text box. Then click 'Save'.

6. Click 'Go'. This will run 'game.py'

7. In the new window, select which Animal ID to use for results. Then click 'Run'

8. The tasks marked as active in the parameters will now run in a fullscreen window.
    Results can be found in main/results/{ID}Data.txt.

You can also run 'game.py' by itself, however this requires a 'parameters.txt' to be
    in the main directory already.




Files included in the Cognitive Testing System:

main/                   -- main directory where everything is

    data/               -- data directory for sound and stimuli
        incorrect.wav   -- negative sound file
        correct.wav     -- positive sound file
        stimuli/        -- directory for stimuli images
            *.png       -- stimuli files are png images

    AnimalIDS.txt       -- text file with subject IDs listed

    defaults.txt        -- text file with default parameters listed

    game.py             -- 1. Displays a pysimplegui window that has the user select an
                                animal ID from a list in 'AnimalIDS.txt' using a mouse, then 
                                closes when 'Run' is clicked
                           2. Starts a window that runs all of the tasks listed as active in
                                'parameters.txt', and uses their values to run the tasks. Tasks
                                are played by using a joystick. Every trial is logged to a results file
                                with the same name as the animal ID chosen.

    menu.py             -- Displays a window that has the user load a parameter_file to
                            use as a base. The user can then use the mouse and keyboard to enter
                            the desired parameters for every task to run. The user has the option to
                            save the parameters to a named file. When 'Go' button is clicked, the current
                            parameters from the window are saved to 'parameters.txt' and then 
                            'game.py' is called.


Files created by menu.py:

main/parameters.txt     -- parameters text file used by game.py, made by menu.py


Files created by game.py:

main/results/           -- results directory made on first game.py run
    
    {ID}Data.txt        -- results log file written to named from animal ID chosen in game.py