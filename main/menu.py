import os, sys

# pip install pysimplegui
import PySimpleGUI as sg

# read animal IDs from file
animal_id_file = open('AnimalIDS.txt', 'r')
ids = animal_id_file.read().splitlines()
animal_id_file.close()

# read default parameters
parameter_file = open('defaults.txt', 'r')
parameters = parameter_file.readlines()
parameter_file.close()

# lambda function overloading pysimplegui Text and Input so that they are all the same size/font
TextCustom = lambda text, font = ('Arial', 11):sg.Text(text = text, font = font, size = (30, 1))
InputTextCustom = lambda key, text = '':sg.InputText(text, size = (15, 1), key = key)

# layout of the rows of options in start menu
options = [ 
            [TextCustom('Subject', font = ('Arial', 11, 'bold')), sg.Combo(ids, key = 'SUBJECT')],
            [TextCustom('Use Params from File', font = ('Arial', 11, 'bold')), InputTextCustom('IN_FILE'), sg.FileBrowse()],
            [TextCustom(' '), sg.Button('Load')],
            [TextCustom('Task Order'), sg.Radio('Series', 'RADIO_TASKORDER', default = True, key = 'TASKORDER'), sg.Radio('Random', 'RADIO_TASKORDER')],
            [TextCustom('Pellets Per Correct Response'), sg.Combo(('1','2','3','4','5','6','7','8','9','10'), key = 'PELLETS')],
            [TextCustom('Auditory Feedback'), sg.Radio('Yes', 'RADIO_AUDFEED', default = True,), sg.Radio('No', 'RADIO_AUDFEED')],
            [TextCustom('Background Color'), sg.Combo(('Grey', 'Red', 'Orange', 'Yellow', 'Green', 'Blue', 'Purple'))],

            [TextCustom('Side Task Active', font = ('Arial', 11, 'bold')), sg.Radio('Yes', 'RADIO_S', default = True), sg.Radio('No', 'RADIO_S')],
            [TextCustom('Trials to Criterion'), InputTextCustom('TRIALS_S')],
            [TextCustom('Timeout Time (seconds)'), InputTextCustom('TIMEOUT_S')],
            [TextCustom('Titration'), sg.Radio('Yes', 'RADIO_STIT', default = True), sg.Radio('No', 'RADIO_STIT')],
            [TextCustom('Start Level'), sg.Combo(('1','2','3','4','5','6'))],

            [TextCustom('Chase Task Active', font = ('Arial', 11, 'bold')), sg.Radio('Yes', 'RADIO_C', default = True), sg.Radio('No', 'RADIO_C')],
            [TextCustom('Trials to Criterion'), InputTextCustom('TRIALS_C')],
            [TextCustom('Timeout Time (seconds)'), InputTextCustom('TIMEOUT_C')],
            [TextCustom('Titration'), sg.Radio('Yes', 'RADIO_CTIT', default = True), sg.Radio('No', 'RADIO_CTIT')],
            [TextCustom('Circle Size'), sg.Combo(('Small', 'Medium', 'Large'))],

            [TextCustom('Pursuit Task Active', font = ('Arial', 11, 'bold')), sg.Radio('Yes', 'RADIO_P', default = True), sg.Radio('No', 'RADIO_P')],
            [TextCustom('Trials to Criterion'), InputTextCustom('TRIALS_P')],
            [TextCustom('Timeout Time (seconds)'), InputTextCustom('TIMEOUT_P')],
            [TextCustom('Pursuit Time (seconds)'), InputTextCustom('PURSUIT_P')],
            [TextCustom('Titration'), sg.Radio('Yes', 'RADIO_PTIT', default = True), sg.Radio('No', 'RADIO_PTIT')],
            [TextCustom('Circle Size'), sg.Combo(('Small', 'Medium', 'Large'))],

            [TextCustom('MTS Task Active', font = ('Arial', 11, 'bold')), sg.Radio('Yes', 'RADIO_MTS', default = True), sg.Radio('No', 'RADIO_MTS')],
            [TextCustom('Trials to Criterion'), InputTextCustom('TRIALS_MTS')],
            [TextCustom('% Correct for Criterion'), InputTextCustom('PERCENT_MTS')],
            [TextCustom('Timeout Time (seconds)'), InputTextCustom('TIMEOUT_MTS')],

            [TextCustom('DMTS Task Active', font = ('Arial', 11, 'bold')), sg.Radio('Yes', 'RADIO_DMTS', default = True), sg.Radio('No', 'RADIO_DMTS')],
            [TextCustom('Trials to Criterion'), InputTextCustom('TRIALS_DMTS')],
            [TextCustom('% Correct for Criterion'), InputTextCustom('PERCENT_DMTS')],
            [TextCustom('Timeout Time (seconds)'), InputTextCustom('TIMEOUT_DMTS')],
            [TextCustom('Delay Time (seconds)'), InputTextCustom('DELAY_DMTS')],

            [TextCustom('Learning Set Task Active', font = ('Arial', 11, 'bold')), sg.Radio('Yes', 'RADIO_L', default = True), sg.Radio('No', 'RADIO_L')],
            [TextCustom('Number of Problems'), InputTextCustom('NUMPROBS_L')],
            [TextCustom('Trials Per Problem'), InputTextCustom('TRIALSPERPROB_L')],
            [TextCustom('Trials Correct for Criterion'), InputTextCustom('TRIALS_L')],
            [TextCustom('% Correct for Criterion'), InputTextCustom('PERCENT_L')],
            [TextCustom('Timeout Time (seconds)'), InputTextCustom('TIMEOUT_L')],
         ]

column = [
            [TextCustom('Save Params to File', font = ('Arial', 11, 'bold'))],
            [InputTextCustom('OUT_FILE'), sg.FileBrowse()]
         ]

# layout of main menu window, options on top to scroll through, then Run button on bottom
layout = [
            [sg.Column(options, scrollable = True)],
            [sg.Column(column), sg.Button('Run', font = ('Arial', 20, 'bold'), button_color = ('white','green'))]
         ]

def read_parameter(name):
    for i in range(0, len(parameters)):
        if parameters[i].find(name) >= 0:
            return parameters[i + 1].rstrip('\n')

def write_parameter(name, value):
    for i in range(0, len(parameters)):
        if parameters[i].find(name) >= 0:
            parameters[i + 1] = value + '\n'
            return

def main():

    # Create the Window
    window = sg.Window('Cognitive Testing System', layout)
    # Event Loop to process 'events' and get the 'values' of the inputs
    while True:             
        event, values = window.read()
        if event in ([None]):   # if user closes window
            window.close()
            sys.exit()
        if event in (['Run']):
            break

    window.close()

    # if input parameter file is given, just use it
    if (values['IN_FILE'] is not ''):
        os.system('python game.py -p ' + values['IN_FILE'] + ' -s ' + values['SUBJECT'])

    # otherwise write settings to parameter.txt to use
    write_parameter('Task Order', ("Random", "Series")[values['TASKORDER']])
    write_parameter('Pellets', values['PELLETS'])


    parameter_file = open('parameters.txt', 'w')
    parameter_file.write('***THIS FILE IS USED BY game.py AND OVERWRITTEN BY menu.py, DO NOT SAVE PERMANENT PARAMETERS HERE***\n\n')
    parameter_file.writelines(parameters)
    parameter_file.close()

    # write to specified permanent output file if given
    if (values['OUT_FILE'] is not ''):
        output_file = open(values['OUT_FILE'], 'w')
        output_file.writelines(parameters)
        output_file.close()

    # use parameters.txt
    os.system('python game.py -p parameters.txt -s ' + values['SUBJECT'])

# this calls the 'main' function when this script is executed
if __name__ == '__main__':
    main()