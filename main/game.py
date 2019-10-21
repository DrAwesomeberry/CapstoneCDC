import os, pygame, argparse, re, sys, datetime, time, random

# pip install pygame --user
from pygame.locals import *
from pygame.compat import geterror

import PySimpleGUI as sg

if not pygame.font: print('Warning, fonts disabled')
if not pygame.mixer: print('Warning, sound disabled')

main_dir = os.path.split(os.path.abspath(__file__))[0]
data_dir = os.path.join(main_dir, 'data')

parser = argparse.ArgumentParser()
parser.add_argument('-p', dest='parameter_file', type=str, help='filename of parameters file to use')
parser.add_argument('-s', dest='subject', type=str, help='subject ID for use in output file')
args = parser.parse_args()

general_parameters_keys = ['TASKORDER', 'PELLETS', 'AUDFEED', 'BACKGROUND_COLOR']
side_parameters_keys = ['ACTIVE', 'TRIALS', 'TIMEOUT', 'TITRATION', 'START_LEVEL']
chase_parameters_keys = ['ACTIVE', 'TRIALS', 'TIMEOUT', 'TITRATION', 'CIRCLE_SIZE']
pursuit_parameters_keys = ['ACTIVE', 'TRIALS', 'TIMEOUT', 'PURSUIT_TIME', 'TITRATION', 'CIRCLE_SIZE']
mts_parameters_keys = ['ACTIVE', 'TRIALS', 'PERCENT', 'TIMEOUT']
dmts_parameters_keys = ['ACTIVE', 'TRIALS', 'PERCENT', 'TIMEOUT', 'DELAY']
learning_parameters_keys = ['ACTIVE', 'NUM_PROBS', 'TRIALS_PER_PROB', 'TRIALS', 'PERCENT', 'TIMEOUT']

general_parameters = dict.fromkeys(general_parameters_keys)
side_parameters = dict.fromkeys(side_parameters_keys)
chase_parameters = dict.fromkeys(chase_parameters_keys)
pursuit_parameters = dict.fromkeys(pursuit_parameters_keys)
mts_parameters = dict.fromkeys(mts_parameters_keys)
dmts_parameters = dict.fromkeys(dmts_parameters_keys)
learning_parameters = dict.fromkeys(learning_parameters_keys)

def read_parameter(name, parameters):
    for i in range(0, len(parameters)):
        if re.search(name, parameters[i], re.IGNORECASE):
            return parameters[i + 1].rstrip('\n')

    sg.Popup('Error:', '\"' + name + '\" parameter does not exist in input file \"' + args.parameter_file + '\"')
    sys.exit()

def load_and_check_params(filename):
    if os.path.exists(filename) is False:
        sg.Popup('Error:', filename + ' does not exist')
        sys.exit()

    parameter_file = open(filename, 'r')
    parameters = parameter_file.readlines()
    parameter_file.close()

    general_parameters['TASKORDER'] = read_parameter('Task Order', parameters)
    general_parameters['PELLETS'] = read_parameter('Pellets', parameters)
    general_parameters['AUDFEED'] = re.search('Yes', read_parameter('Auditory Feedback', parameters), re.IGNORECASE)
    general_parameters['BACKGROUND_COLOR'] = read_parameter('Background Color', parameters)

    side_parameters['ACTIVE'] = re.search('Yes', read_parameter('Side Task Active', parameters), re.IGNORECASE)
    if side_parameters['ACTIVE']:
        side_parameters['TRIALS'] = int(read_parameter('Side Task Trials to Criterion', parameters))
        side_parameters['TIMEOUT'] = int(read_parameter('Side Task Timeout Time', parameters))
        side_parameters['TITRATION'] = re.search('Yes', read_parameter('Side Task Titration', parameters), re.IGNORECASE)
        side_parameters['START_LEVEL'] = int(read_parameter('Side Start Level', parameters))

    chase_parameters['ACTIVE'] = re.search('Yes', read_parameter('Chase Task Active', parameters), re.IGNORECASE)
    if chase_parameters['ACTIVE']:
        chase_parameters['TRIALS'] = read_parameter('Chase Task Trials to Criterion', parameters)
        chase_parameters['TIMEOUT'] = read_parameter('Chase Task Timeout Time', parameters)
        chase_parameters['TITRATION'] = re.search('Yes', read_parameter('Chase Task Titration', parameters), re.IGNORECASE)
        chase_parameters['CIRCLE_SIZE'] = read_parameter('Chase Circle Size', parameters)

    pursuit_parameters['ACTIVE'] = re.search('Yes', read_parameter('Pursuit Task Active', parameters), re.IGNORECASE)
    if pursuit_parameters['ACTIVE']:
        pursuit_parameters['TRIALS'] = read_parameter('Pursuit Task Trials to Criterion', parameters)
        pursuit_parameters['TIMEOUT'] = read_parameter('Pursuit Task Timeout Time', parameters)
        pursuit_parameters['PURSUIT_TIME'] = read_parameter('Pursuit Task Pursuit Time', parameters)
        pursuit_parameters['TITRATION'] = re.search('Yes', read_parameter('Pursuit Task Titration', parameters), re.IGNORECASE)
        pursuit_parameters['CIRCLE_SIZE'] = read_parameter('Pursuit Circle Size', parameters)

    mts_parameters['ACTIVE'] = re.search('Yes', read_parameter('MTS Task Active', parameters), re.IGNORECASE)
    if mts_parameters['ACTIVE']:
        mts_parameters['TRIALS'] = read_parameter('MTS Task Trials for Criterion', parameters)
        mts_parameters['PRECENT'] = read_parameter('MTS Task % Correct for Criterion', parameters)
        mts_parameters['TIMEOUT'] = read_parameter('MTS Task Timeout Time', parameters)

    dmts_parameters['ACTIVE'] = re.search('Yes', read_parameter('DMTS Task Active', parameters), re.IGNORECASE)
    if dmts_parameters['ACTIVE']:
        dmts_parameters['TRIALS'] = read_parameter('DMTS Task Trials for Criterion', parameters)
        dmts_parameters['PRECENT'] = read_parameter('DMTS Task % Correct for Criterion', parameters)
        dmts_parameters['TIMEOUT'] = read_parameter('DMTS Task Timeout Time', parameters)
        dmts_parameters['DELAY'] = read_parameter('DMTS Delay Time', parameters)

    learning_parameters['ACTIVE'] = re.search('Yes', read_parameter('Learning Set Task Active', parameters), re.IGNORECASE)
    if learning_parameters['ACTIVE']:
        learning_parameters['NUM_PROBS'] = read_parameter('Learning Set Number of Problems', parameters)
        learning_parameters['TRIALS_PER_PROB'] = read_parameter('Learning Set Trials Per Problem', parameters)
        learning_parameters['TRIALS'] = read_parameter('Learning Set Trials Correct for Criterion', parameters)
        learning_parameters['PERCENT'] = read_parameter('Learning Set % Correct for Criterion', parameters)
        learning_parameters['TIMEOUT'] = read_parameter('Learning Set Timeout Time', parameters)

def write_event(file, game, value):
    time = datetime.datetime.now()
    file.write(time.strftime('%m-%d-%Y %H:%M:%S  ') + game + '  ' + value + '\n')

def random_list(start, end, length): 
    res = [] 
  
    while len(res) != length: 
        r = random.randint(start, end)
        if r not in res:
            res.append(r)
  
    return res 

# functions to create our resources
def load_image(name, colorkey=None):
    fullname = os.path.join(data_dir, name)
    try:
        image = pygame.image.load(fullname)
    except pygame.error:
        print('Cannot load image:', fullname)
        raise SystemExit(str(geterror()))
    image = image.convert()
    if colorkey is not None:
        if colorkey == -1:
            colorkey = image.get_at((0,0))
        image.set_colorkey(colorkey, RLEACCEL)
    return image, image.get_rect()


def load_sound(name):
    class NoneSound:
        def play(self): pass
    if not pygame.mixer or not pygame.mixer.get_init():
        return NoneSound()
    fullname = os.path.join(data_dir, name)
    try:
        sound = pygame.mixer.Sound(fullname)
    except pygame.error:
        print('Cannot load sound: %s' % fullname)
        raise SystemExit(str(geterror()))
    return sound


# classes for our game objects
class Pointer(pygame.sprite.Sprite):
    """moves a pointer on the screen, following the mouse"""
    def __init__(self):
        pygame.sprite.Sprite.__init__(self) #call Sprite initializer
        self.image = pygame.Surface([25,25])
        self.image.fill((255,0,0))
        self.rect = self.image.get_rect(center=(0, 0))

        # Count the joysticks the computer has
        self.joystick_count = pygame.joystick.get_count()
        if self.joystick_count == 0:
            # No joysticks!
            sg.Popup("Error:", "No joystick detected")
            sys.exit()
        else:
            # Use joystick #0 and initialize it
            self.my_joystick = pygame.joystick.Joystick(0)
            self.my_joystick.init()

    def reset(self, x, y):
        self.rect.x = x
        self.rect.y = y

    def update(self):
        """move the pointer based on the mouse position"""
        # pos = pygame.mouse.get_pos()
        # self.rect.midtop = pos

        # move based on joystick
        # As long as there is a joystick
        if self.joystick_count != 0:
 
            # This gets the position of the axis on the game controller
            # It returns a number between -1.0 and +1.0
            horiz_axis_pos = self.my_joystick.get_axis(0)
            if abs(horiz_axis_pos) < 0.1:
                horiz_axis_pos = 0

            vert_axis_pos = self.my_joystick.get_axis(1)
            if abs(vert_axis_pos) < 0.1:
                vert_axis_pos = 0
 
            # Move x according to the axis. We multiply by 10 to speed up the
            # movement.
            self.rect.x = self.rect.x + horiz_axis_pos * 10
            self.rect.y = self.rect.y + vert_axis_pos * 10


"""this function is called when the program starts.
       it initializes everything it needs, then runs in
       a loop until the function returns."""
def main():
    load_and_check_params(args.parameter_file)

    results_path = os.path.join(main_dir, 'results')
    if not os.path.exists(results_path):
        os.makedirs(results_path)
    results_file = open(os.path.join(results_path, args.subject + 'Data.txt'), 'a+')

    # Initialize Everything
    pygame.init()
    screen = pygame.display.set_mode((0, 0), pygame.FULLSCREEN)
    pygame.mouse.set_visible(0)

    # Create The Backgound
    background = pygame.Surface(screen.get_size())
    background = background.convert()
    background.fill((250, 250, 250))

    # Display The Background
    screen.blit(background, (0, 0))
    pygame.display.flip()

    # Prepare Game Objects
    clock = pygame.time.Clock()
    incorrect_sound = load_sound('incorrect.wav')
    correct_sound = load_sound('correct.wav')
    pointer = Pointer()
    allsprites = pygame.sprite.RenderPlain((pointer))
    pointer.reset(background.get_width()/2, background.get_height()/2)

    GREEN = (0,255,0)

    if side_parameters['ACTIVE']:
        current_game = 'Side'
    elif chase_parameters['ACTIVE']:
        current_game = 'Chase'
    elif pursuit_parameters['ACTIVE']:
        current_game = 'Pursuit'
    elif mts_parameters['ACTIVE']:
        current_game = 'MTS'
    elif dmts_parameters['ACTIVE']:
        current_game = 'DMTS'
    elif learning_parameters['ACTIVE']:
        current_game = 'LS'

    side_level = side_parameters['START_LEVEL']
    if side_level in (1,2):
        side_wall_list = [0,1,2,3]
    elif side_level == 3:
        side_wall_list = random_list(0, 3, 3)
    elif side_level == 4:
        side_wall_list = random_list(0, 3, 2)
    elif side_level == 5:
        side_wall_list = random_list(0, 3, 1)
    elif side_level == 6:
        side_wall_list = random_list(4, 7, 1)
    side_walls = [
                    pygame.Rect(0,0,background.get_width(),200),
                    pygame.Rect(0,background.get_height() - 200,background.get_width(),200),
                    pygame.Rect(0,0,200,background.get_height()),
                    pygame.Rect(background.get_width()-200,0,200,background.get_height()),
                    pygame.Rect(0,0,background.get_width()/4,200),
                    pygame.Rect(0,background.get_height() - 200,background.get_width()/4,200),
                    pygame.Rect(0,0,200,background.get_height()/4),
                    pygame.Rect(background.get_width()-200,0,200,background.get_height()/4)
                 ]

    correct = False
    timeout = False
    trials = 0
    start_time = time.time()

    # Main Loop
    going = True
    while going:

        clock.tick(60)

        # Handle Input Events
        for event in pygame.event.get():
            if event.type == QUIT:
                going = False
            elif event.type == KEYDOWN and event.key == K_ESCAPE:
                going = False

        allsprites.update()
        pygame.display.update()

        # Draw Everything
        screen.blit(background, (0, 0))
        allsprites.draw(screen)
        #pygame.display.flip()

        if current_game == 'Side':
            if (time.time() - start_time > side_parameters['TIMEOUT']):
                timeout = True
            elif side_level == 1:
                for i in side_wall_list:
                    screen.fill(GREEN, side_walls[i])
                for event in pygame.event.get():
                    if event.type == pygame.JOYAXISMOTION:
                        correct = True
            elif side_level in (2,3,4,5,6):
                for i in side_wall_list:
                    screen.fill(GREEN, side_walls[i])
                    if side_walls[i].colliderect(pointer):
                        correct = True

            if correct or timeout:
                trials += 1
                if correct:
                    correct_sound.play()
                    value = "{}  {}  Correct  {}".format(trials, side_level, time.time() - start_time)
                if timeout:
                    incorrect_sound.play()
                    value = "{}  {}  Timeout  {}".format(trials, side_level, time.time() - start_time)
                write_event(results_file, current_game, value)
                time.sleep(3)
                pointer.reset(background.get_width()/2, background.get_height()/2)
                start_time = time.time() # reset
                correct = False
                timeout = False
                if trials >= side_parameters['TRIALS']:
                    trials = 0
                    side_level += 1
                    if side_level > 6: # continue to next stage
                        current_game = 'Chase'
                if side_level in (1,2):
                    side_wall_list = [0,1,2,3]
                elif side_level == 3:
                    side_wall_list = random_list(0, 3, 3)
                elif side_level == 4:
                    side_wall_list = random_list(0, 3, 2)
                elif side_level == 5:
                    side_wall_list = random_list(0, 3, 1)
                elif side_level == 6:
                    side_wall_list = random_list(4, 7, 1)

        elif current_game == 'Chase':
            break





    pygame.quit()
    results_file.close()

# Game Over


# this calls the 'main' function when this script is executed
if __name__ == '__main__':
    main()