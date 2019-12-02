import os, sys, re

# pip install pysimplegui
import PySimpleGUI as sg

# lambda function overloading pysimplegui Text and Input so that they are all the same size/font
TextCustom = lambda text, font = ('Arial', 11):sg.Text(text = text, font = font, size = (30, 1))
InputTextCustom = lambda key, text = '':sg.InputText(text, size = (15, 1), key = key)

# layout of the rows of options in start menu
options = [ 
            [TextCustom('Use Parameters from File', font = ('Arial', 11, 'bold')), InputTextCustom('IN_FILE'), sg.FileBrowse()],
            [TextCustom(' '), sg.Button('Load')],
            [TextCustom('Task Order'), sg.Radio('Series', 'RADIO_TASKORDER', key = 'TASKORDER_SERIES'), sg.Radio('Random', 'RADIO_TASKORDER', key = 'TASKORDER_RAND')],

            [sg.T(' '  * 10)],

            [TextCustom('Side Task Active', font = ('Arial', 11, 'bold')), sg.Radio('Yes', 'RADIO_S', key = 'S_YES'), sg.Radio('No', 'RADIO_S', key = 'S_NO')],
            [TextCustom('Trials to Criterion'), InputTextCustom('TRIALS_S')],
            [TextCustom('Start Level'), sg.Combo(('','1','2','3','4','5','6'), key = 'LEVEL_S')],
            [TextCustom('Response Time (seconds)'), InputTextCustom('RESPONSE_S')],
            [TextCustom('Timeout Time (seconds)'), InputTextCustom('TIMEOUT_S')],
            [TextCustom('Titration'), sg.Radio('Yes', 'RADIO_STIT', key = 'TIT_S_YES'), sg.Radio('No', 'RADIO_STIT', key = 'TIT_S_NO')],

            [sg.T(' '  * 10)],

            [TextCustom('Chase Task Active', font = ('Arial', 11, 'bold')), sg.Radio('Yes', 'RADIO_C', key = 'C_YES'), sg.Radio('No', 'RADIO_C', key = 'C_NO')],
            [TextCustom('Trials to Criterion'), InputTextCustom('TRIALS_C')],
            [TextCustom('Circle Size'), sg.Combo(('','Small', 'Medium', 'Large'), key = 'CIRCLE_C')],
            [TextCustom('Response Time (seconds)'), InputTextCustom('RESPONSE_C')],
            [TextCustom('Timeout Time (seconds)'), InputTextCustom('TIMEOUT_C')],
            [TextCustom('Titration'), sg.Radio('Yes', 'RADIO_CTIT', key = 'TIT_C_YES'), sg.Radio('No', 'RADIO_CTIT', key = 'TIT_C_NO')],

            [sg.T(' '  * 10)],

            [TextCustom('Pursuit Task Active', font = ('Arial', 11, 'bold')), sg.Radio('Yes', 'RADIO_P', key = 'P_YES'), sg.Radio('No', 'RADIO_P', key = 'P_NO')],
            [TextCustom('Trials to Criterion'), InputTextCustom('TRIALS_P')],
            [TextCustom('Circle Size'), sg.Combo(('','Small','Medium','Large'), key = 'CIRCLE_P')],
            [TextCustom('Pursuit Time (seconds)'), InputTextCustom('PURSUIT_P')],
            [TextCustom('Response Time (seconds)'), InputTextCustom('RESPONSE_P')],
            [TextCustom('Timeout Time (seconds)'), InputTextCustom('TIMEOUT_P')],
            [TextCustom('Titration'), sg.Radio('Yes', 'RADIO_PTIT', key = 'TIT_P_YES'), sg.Radio('No', 'RADIO_PTIT', key = 'TIT_P_NO')],

            [sg.T(' '  * 10)],

            [TextCustom('MTS Task Active', font = ('Arial', 11, 'bold')), sg.Radio('Yes', 'RADIO_MTS', key = 'MTS_YES'), sg.Radio('No', 'RADIO_MTS', key = 'MTS_NO')],
            [TextCustom('Trials to Criterion'), InputTextCustom('TRIALS_MTS')],
            [TextCustom('% Correct for Criterion'), InputTextCustom('PERCENT_MTS')],
            [TextCustom('Response Time (seconds)'), InputTextCustom('RESPONSE_MTS')],
            [TextCustom('Timeout Time (seconds)'), InputTextCustom('TIMEOUT_MTS')],
            [TextCustom('Titration'), sg.Radio('Yes', 'RADIO_MTSTIT', key = 'TIT_MTS_YES'), sg.Radio('No', 'RADIO_MTSTIT', key = 'TIT_MTS_NO')],

            [sg.T(' '  * 10)],

            [TextCustom('DMTS Task Active', font = ('Arial', 11, 'bold')), sg.Radio('Yes', 'RADIO_DMTS', key = 'DMTS_YES'), sg.Radio('No', 'RADIO_DMTS', key = 'DMTS_NO')],
            [TextCustom('Trials to Criterion'), InputTextCustom('TRIALS_DMTS')],
            [TextCustom('% Correct for Criterion'), InputTextCustom('PERCENT_DMTS')],
            [TextCustom('Delay Time (seconds)'), InputTextCustom('DELAY_DMTS')],
            [TextCustom('Response Time (seconds)'), InputTextCustom('RESPONSE_DMTS')],
            [TextCustom('Timeout Time (seconds)'), InputTextCustom('TIMEOUT_DMTS')],
            [TextCustom('Titration'), sg.Radio('Yes', 'RADIO_DMTSTIT', key = 'TIT_DMTS_YES'), sg.Radio('No', 'RADIO_DMTSTIT', key = 'TIT_DMTS_NO')],

            [sg.T(' '  * 10)],

            [TextCustom('Learning Set Task Active', font = ('Arial', 11, 'bold')), sg.Radio('Yes', 'RADIO_LS', key = 'L_YES'), sg.Radio('No', 'RADIO_LS', key = 'L_NO')],
            [TextCustom('Trials Per Problem'), InputTextCustom('TRIALSPERPROB_LS')],
            [TextCustom('Number of Problems'), InputTextCustom('NUMPROBS_LS')],
            [TextCustom('% Correct for Criterion'), InputTextCustom('PERCENT_LS')],
            [TextCustom('Response Time (seconds)'), InputTextCustom('RESPONSE_LS')],
            [TextCustom('Timeout Time (seconds)'), InputTextCustom('TIMEOUT_LS')],
            [TextCustom('Titration'), sg.Radio('Yes', 'RADIO_LSTIT', key = 'TIT_LS_YES'), sg.Radio('No', 'RADIO_LSTIT', key = 'TIT_LS_NO')],
         ]

column = [
            [TextCustom('Save Current Parameters to File', font = ('Arial', 11, 'bold'))],
            [InputTextCustom('OUT_FILE'), sg.FileBrowse()],
            [sg.Button('Save')]
         ]

# layout of main menu window, options on top to scroll through, then Run button on bottom
layout = [
            [sg.Column(options, scrollable = True)],
            [sg.Column(column), sg.Button('Go', font = ('Arial', 25, 'bold'), button_color = ('white','green'))]
         ]

def read_parameter(name, parameters):
    for i in range(0, len(parameters)):
        if re.search(name, parameters[i], re.IGNORECASE):
            return parameters[i + 1].rstrip('\n')

    return ''

def write_parameter(name, value, parameters):
    if value not in ('', None): # only write parameters that have filled out fields
        for i in range(0, len(parameters)):
            if re.search(name, parameters[i], re.IGNORECASE):
                parameters[i + 1] = value + '\n'
                return

    sg.Popup('Warning:', name + ' not found in input parameter format, so not saved to output file')

def load_parameters(filename, values, window):
    if os.path.exists(filename) is False:
        sg.Popup('Error:', filename + ' does not exist')
        return

    parameter_file = open(filename, 'r')
    parameters = parameter_file.readlines()
    parameter_file.close()

    window['TASKORDER_SERIES'].Update(re.search('Series', read_parameter('Task Order', parameters), re.IGNORECASE))
    window['TASKORDER_RAND'].Update(re.search('Random', read_parameter('Task Order', parameters), re.IGNORECASE))

    window['S_YES'].Update(re.search('Yes', read_parameter('Side Task Active', parameters), re.IGNORECASE))
    window['S_NO'].Update(re.search('No', read_parameter('Side Task Active', parameters), re.IGNORECASE))
    window['TRIALS_S'].Update(read_parameter('Side Task Trials to Criterion', parameters))
    window['LEVEL_S'].Update(read_parameter('Side Start Level', parameters))
    window['RESPONSE_S'].Update(read_parameter('Side Task Response Time', parameters))
    window['TIMEOUT_S'].Update(read_parameter('Side Task Timeout Time', parameters))
    window['TIT_S_YES'].Update(re.search('Yes', read_parameter('Side Task Titration', parameters), re.IGNORECASE))
    window['TIT_S_NO'].Update(re.search('No', read_parameter('Side Task Titration', parameters), re.IGNORECASE))

    window['C_YES'].Update(re.search('Yes', read_parameter('Chase Task Active', parameters), re.IGNORECASE))
    window['C_NO'].Update(re.search('No', read_parameter('Chase Task Active', parameters), re.IGNORECASE))
    window['TRIALS_C'].Update(read_parameter('Chase Task Trials to Criterion', parameters))
    window['CIRCLE_C'].Update(read_parameter('Chase Circle Size', parameters))
    window['RESPONSE_C'].Update(read_parameter('Chase Task Response Time', parameters))
    window['TIMEOUT_C'].Update(read_parameter('Chase Task Timeout Time', parameters))
    window['TIT_C_YES'].Update(re.search('Yes', read_parameter('Chase Task Titration', parameters), re.IGNORECASE))
    window['TIT_C_NO'].Update(re.search('No', read_parameter('Chase Task Titration', parameters), re.IGNORECASE))

    window['P_YES'].Update(re.search('Yes', read_parameter('Pursuit Task Active', parameters), re.IGNORECASE))
    window['P_NO'].Update(re.search('No', read_parameter('Pursuit Task Active', parameters), re.IGNORECASE))
    window['TRIALS_P'].Update(read_parameter('Pursuit Task Trials to Criterion', parameters))
    window['CIRCLE_P'].Update(read_parameter('Pursuit Circle Size', parameters))
    window['PURSUIT_P'].Update(read_parameter('Pursuit Task Pursuit Time', parameters))
    window['RESPONSE_P'].Update(read_parameter('Pursuit Task Response Time', parameters))
    window['TIMEOUT_P'].Update(read_parameter('Pursuit Task Timeout Time', parameters))
    window['TIT_P_YES'].Update(re.search('Yes', read_parameter('Pursuit Task Titration', parameters), re.IGNORECASE))
    window['TIT_P_NO'].Update(re.search('No', read_parameter('Pursuit Task Titration', parameters), re.IGNORECASE))

    window['MTS_YES'].Update(re.search('Yes', read_parameter('MTS Task Active', parameters), re.IGNORECASE))
    window['MTS_NO'].Update(re.search('No', read_parameter('MTS Task Active', parameters), re.IGNORECASE))
    window['TRIALS_MTS'].Update(read_parameter('MTS Task Trials for Criterion', parameters))
    window['PERCENT_MTS'].Update(read_parameter('MTS Task % Correct for Criterion', parameters))
    window['RESPONSE_MTS'].Update(read_parameter('MTS Task Response Time', parameters))
    window['TIMEOUT_MTS'].Update(read_parameter('MTS Task Timeout Time', parameters))
    window['TIT_MTS_YES'].Update(re.search('Yes', read_parameter('MTS Task Titration', parameters), re.IGNORECASE))
    window['TIT_MTS_NO'].Update(re.search('No', read_parameter('MTS Task Titration', parameters), re.IGNORECASE))

    window['DMTS_YES'].Update(re.search('Yes', read_parameter('DMTS Task Active', parameters), re.IGNORECASE))
    window['DMTS_NO'].Update(re.search('No', read_parameter('DMTS Task Active', parameters), re.IGNORECASE))
    window['TRIALS_DMTS'].Update(read_parameter('DMTS Task Trials for Criterion', parameters))
    window['PERCENT_DMTS'].Update(read_parameter('DMTS Task % Correct for Criterion', parameters))
    window['DELAY_DMTS'].Update(read_parameter('DMTS Delay Time', parameters))
    window['RESPONSE_DMTS'].Update(read_parameter('DMTS Task Response Time', parameters))
    window['TIMEOUT_DMTS'].Update(read_parameter('DMTS Task Timeout Time', parameters))
    window['TIT_DMTS_YES'].Update(re.search('Yes', read_parameter('DMTS Task Titration', parameters), re.IGNORECASE))
    window['TIT_DMTS_NO'].Update(re.search('No', read_parameter('DMTS Task Titration', parameters), re.IGNORECASE))

    window['L_YES'].Update(re.search('Yes', read_parameter('Learning Set Task Active', parameters), re.IGNORECASE))
    window['L_NO'].Update(re.search('No', read_parameter('Learning Set Task Active', parameters), re.IGNORECASE))
    window['TRIALSPERPROB_LS'].Update(read_parameter('Learning Set Trials Per Problem', parameters))
    window['NUMPROBS_LS'].Update(read_parameter('Learning Set Number of Problems', parameters))
    window['PERCENT_LS'].Update(read_parameter('Learning Set % Correct for Criterion', parameters))
    window['RESPONSE_LS'].Update(read_parameter('Learning Set Response Time', parameters))
    window['TIMEOUT_LS'].Update(read_parameter('Learning Set Timeout Time', parameters))
    window['TIT_LS_YES'].Update(re.search('Yes', read_parameter('Learning Set Titration', parameters), re.IGNORECASE))
    window['TIT_LS_NO'].Update(re.search('No', read_parameter('Learning Set Titration', parameters), re.IGNORECASE))


    return parameters

def save_parameters(filename, values, parameters):

    write_parameter('Task Order', ('Random','Series')[values['TASKORDER_SERIES']], parameters)

    write_parameter('Side Task Active', ('No','Yes')[values['S_YES']], parameters)
    write_parameter('Side Task Trials to Criterion', values['TRIALS_S'], parameters)
    write_parameter('Side Start Level', values['LEVEL_S'], parameters)
    write_parameter('Side Task Response Time', values['RESPONSE_S'], parameters)
    write_parameter('Side Task Timeout Time', values['TIMEOUT_S'], parameters)
    write_parameter('Side Task Titration', ('No','Yes')[values['TIT_S_YES']], parameters)

    write_parameter('Chase Task Active', ('No','Yes')[values['C_YES']], parameters)
    write_parameter('Chase Task Trials to Criterion', values['TRIALS_C'], parameters)
    write_parameter('Chase Circle Size', values['CIRCLE_C'], parameters)
    write_parameter('Chase Task Response Time', values['RESPONSE_C'], parameters)
    write_parameter('Chase Task Timeout Time', values['TIMEOUT_C'], parameters)
    write_parameter('Chase Task Titration', ('No','Yes')[values['TIT_C_YES']], parameters)

    write_parameter('Pursuit Task Active', ('No','Yes')[values['P_YES']], parameters)
    write_parameter('Pursuit Task Trials to Criterion', values['TRIALS_P'], parameters)
    write_parameter('Pursuit Circle Size', values['CIRCLE_P'], parameters)
    write_parameter('Pursuit Task Pursuit Time', values['PURSUIT_P'], parameters)
    write_parameter('Pursuit Task Response Time', values['RESPONSE_P'], parameters)
    write_parameter('Pursuit Task Timeout Time', values['TIMEOUT_P'], parameters)
    write_parameter('Pursuit Task Titration', ('No','Yes')[values['TIT_P_YES']], parameters)

    write_parameter('MTS Task Active', ('No','Yes')[values['MTS_YES']], parameters)
    write_parameter('MTS Task Trials for Criterion', values['TRIALS_MTS'], parameters)
    write_parameter('MTS Task % Correct for Criterion', values['PERCENT_MTS'], parameters)
    write_parameter('MTS Task Response Time', values['RESPONSE_MTS'], parameters)
    write_parameter('MTS Task Timeout Time', values['TIMEOUT_MTS'], parameters)
    write_parameter('MTS Task Titration', ('No','Yes')[values['TIT_MTS_YES']], parameters)

    write_parameter('DMTS Task Active', ('No','Yes')[values['DMTS_YES']], parameters)
    write_parameter('DMTS Task Trials for Criterion', values['TRIALS_DMTS'], parameters)
    write_parameter('DMTS Task % Correct for Criterion', values['PERCENT_DMTS'], parameters)
    write_parameter('DMTS Delay Time', values['DELAY_DMTS'], parameters)
    write_parameter('DMTS Task Response Time', values['RESPONSE_DMTS'], parameters)
    write_parameter('DMTS Task Timeout Time', values['TIMEOUT_DMTS'], parameters)
    write_parameter('DMTS Task Titration', ('No','Yes')[values['TIT_DMTS_YES']], parameters)

    write_parameter('Learning Set Task Active', ('No','Yes')[values['L_YES']], parameters)
    write_parameter('Learning Set Trials Per Problem', values['TRIALSPERPROB_LS'], parameters)
    write_parameter('Learning Set Number of Problems', values['NUMPROBS_LS'], parameters)
    write_parameter('Learning Set % Correct for Criterion', values['PERCENT_LS'], parameters)
    write_parameter('Learning Set Response Time', values['RESPONSE_LS'], parameters)
    write_parameter('Learning Set Timeout Time', values['TIMEOUT_LS'], parameters)
    write_parameter('Learning Set Titration', ('No','Yes')[values['TIT_LS_YES']], parameters)

    parameter_file = open(filename, 'w')
    parameter_file.writelines(parameters)
    parameter_file.close()

def main():
    loaded = False

    # Create the Window
    window = sg.Window('Cognitive Testing System', layout)
    # Event Loop to process 'events' and get the 'values' of the inputs
    while True:             
        event, values = window.read()
        if event in ([None]):   # if user closes window
            window.close()
            sys.exit()
        if event in (['Load']):
            if (values['IN_FILE'] not in ('', None)):
                parameters = load_parameters(values['IN_FILE'], values, window)
                loaded = True
            else:
                sg.Popup('Error:', 'No filename to load parameters from')
        if event in (['Save']):
            if (values['OUT_FILE'] not in ('', None)):
                if loaded is True:
                    save_parameters(values['OUT_FILE'], values, parameters)
                else:
                    sg.Popup('Error:', 'Need to load parameters from file once first to get format')
            else:
                sg.Popup('Error:', 'No filename to save parameters to')
        if event in (['Go']):
            error = False
            if loaded is False: # need to have input parameters
                error = True
                sg.Popup('Error:', 'Must load parameters from file first')
            if error is False:
                break

    window.close()

    save_parameters('parameters.txt', values, parameters)

    # use parameters.txt
    os.system('python3 game.py')

# this calls the 'main' function when this script is executed
if __name__ == '__main__':
    main()
