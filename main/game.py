import os, pygame, argparse, re, sys, datetime, time, random

# pip install pygame --user
from pygame.locals import *
from pygame.compat import geterror

# from adafruit_motorkit import MotorKit
# from adafruit_motor import stepper
# kit = MotorKit()
# motor_dir = 1
# dir_num = 0

import PySimpleGUI as sg

if not pygame.font: print('Warning, fonts disabled')
if not pygame.mixer: print('Warning, sound disabled')

main_dir = os.path.split(os.path.abspath(__file__))[0]
data_dir = os.path.join(main_dir, 'data')
stimuli_dir = os.path.join(data_dir, 'stimuli')

parser = argparse.ArgumentParser()
parser.add_argument('-p', dest='parameter_file', type=str, help='filename of parameters file to use')
parser.add_argument('-s', dest='subject', type=str, help='subject ID for use in output file')
args = parser.parse_args()

general_parameters_keys = ['TASKORDER', 'PELLETS', 'AUDFEED', 'BACKGROUND_COLOR']
side_parameters_keys = ['ACTIVE', 'TRIALS', 'START_LEVEL', 'RESPONSE', 'TIMEOUT', 'TITRATION']
chase_parameters_keys = ['ACTIVE', 'TRIALS', 'CIRCLE_SIZE', 'RESPONSE', 'TIMEOUT', 'TITRATION']
pursuit_parameters_keys = ['ACTIVE', 'TRIALS', 'CIRCLE_SIZE', 'PURSUIT_TIME', 'RESPONSE', 'TIMEOUT', 'TITRATION']
mts_parameters_keys = ['ACTIVE', 'TRIALS', 'PERCENT', 'RESPONSE', 'TIMEOUT', 'TITRATION']
dmts_parameters_keys = ['ACTIVE', 'TRIALS', 'PERCENT', 'DELAY', 'RESPONSE', 'TIMEOUT', 'TITRATION']
learning_parameters_keys = ['ACTIVE', 'TRIALS_PER_PROB', 'NUM_PROBS', 'PERCENT', 'RESPONSE', 'TIMEOUT', 'TITRATION']

general_parameters = dict.fromkeys(general_parameters_keys)
side_parameters = dict.fromkeys(side_parameters_keys)
chase_parameters = dict.fromkeys(chase_parameters_keys)
pursuit_parameters = dict.fromkeys(pursuit_parameters_keys)
mts_parameters = dict.fromkeys(mts_parameters_keys)
dmts_parameters = dict.fromkeys(dmts_parameters_keys)
learning_parameters = dict.fromkeys(learning_parameters_keys)
game_list = ['']

GREEN = (0,255,0)
RED = (255,0,0)
BACKGROUND_COLOR_RGB = (250,250,250)

def pellet():
    return
    # for j in range(30):
    #     time.sleep(0.01)
    #     if motor_dir == 1:
    #         kit.stepper1.onestep(style=stepper.DOUBLE, direction=stepper.FORWARD)
    #     else:
    #         kit.stepper1.onestep(style=stepper.DOUBLE, direction=stepper.BACKWARD)
    
    # dir_num += 1
    # if dir_num > 5:
    #     dir_num = 0
    #     motor_dir = motor_dir * -1

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
    general_parameters['PELLETS'] = int(read_parameter('Pellets', parameters))
    general_parameters['AUDFEED'] = re.search('Yes', read_parameter('Auditory Feedback', parameters), re.IGNORECASE)
    general_parameters['BACKGROUND_COLOR'] = read_parameter('Background Color', parameters)

    side_parameters['ACTIVE'] = re.search('Yes', read_parameter('Side Task Active', parameters), re.IGNORECASE)
    if side_parameters['ACTIVE']:
        side_parameters['TRIALS'] = int(read_parameter('Side Task Trials to Criterion', parameters))
        side_parameters['START_LEVEL'] = int(read_parameter('Side Start Level', parameters))
        side_parameters['RESPONSE'] = float(read_parameter('Side Task Response Time', parameters))
        side_parameters['TIMEOUT'] = float(read_parameter('Side Task Timeout Time', parameters))
        side_parameters['TITRATION'] = re.search('Yes', read_parameter('Side Task Titration', parameters), re.IGNORECASE)
        game_list.append('Side')

    chase_parameters['ACTIVE'] = re.search('Yes', read_parameter('Chase Task Active', parameters), re.IGNORECASE)
    if chase_parameters['ACTIVE']:
        chase_parameters['TRIALS'] = int(read_parameter('Chase Task Trials to Criterion', parameters))
        chase_parameters['CIRCLE_SIZE'] = read_parameter('Chase Circle Size', parameters)
        chase_parameters['RESPONSE'] = float(read_parameter('Chase Task Response Time', parameters))
        chase_parameters['TIMEOUT'] = float(read_parameter('Chase Task Timeout Time', parameters))
        chase_parameters['TITRATION'] = re.search('Yes', read_parameter('Chase Task Titration', parameters), re.IGNORECASE)
        game_list.append('Chase')

    pursuit_parameters['ACTIVE'] = re.search('Yes', read_parameter('Pursuit Task Active', parameters), re.IGNORECASE)
    if pursuit_parameters['ACTIVE']:
        pursuit_parameters['TRIALS'] = int(read_parameter('Pursuit Task Trials to Criterion', parameters))
        pursuit_parameters['CIRCLE_SIZE'] = read_parameter('Pursuit Circle Size', parameters)
        pursuit_parameters['PURSUIT_TIME'] = float(read_parameter('Pursuit Task Pursuit Time', parameters))
        pursuit_parameters['RESPONSE'] = float(read_parameter('Pursuit Task Response Time', parameters))
        pursuit_parameters['TIMEOUT'] = float(read_parameter('Pursuit Task Timeout Time', parameters))
        pursuit_parameters['TITRATION'] = re.search('Yes', read_parameter('Pursuit Task Titration', parameters), re.IGNORECASE)
        game_list.append('Pursuit')

    mts_parameters['ACTIVE'] = re.search('Yes', read_parameter('MTS Task Active', parameters), re.IGNORECASE)
    if mts_parameters['ACTIVE']:
        mts_parameters['TRIALS'] = float(read_parameter('MTS Task Trials for Criterion', parameters))
        mts_parameters['PERCENT'] = float(read_parameter('MTS Task % Correct for Criterion', parameters))
        mts_parameters['RESPONSE'] = float(read_parameter('MTS Task Response Time', parameters))
        mts_parameters['TIMEOUT'] = float(read_parameter('MTS Task Timeout Time', parameters))
        mts_parameters['TITRATION'] = re.search('Yes', read_parameter('MTS Task Titration', parameters), re.IGNORECASE)
        game_list.append('MTS')

    dmts_parameters['ACTIVE'] = re.search('Yes', read_parameter('DMTS Task Active', parameters), re.IGNORECASE)
    if dmts_parameters['ACTIVE']:
        dmts_parameters['TRIALS'] = int(read_parameter('DMTS Task Trials for Criterion', parameters))
        dmts_parameters['PERCENT'] = float(read_parameter('DMTS Task % Correct for Criterion', parameters))
        dmts_parameters['DELAY'] = float(read_parameter('DMTS Delay Time', parameters))
        dmts_parameters['RESPONSE'] = float(read_parameter('DMTS Task Response Time', parameters))
        dmts_parameters['TIMEOUT'] = float(read_parameter('DMTS Task Timeout Time', parameters))
        dmts_parameters['TITRATION'] = re.search('Yes', read_parameter('DMTS Task Titration', parameters), re.IGNORECASE)
        game_list.append('DMTS')

    learning_parameters['ACTIVE'] = re.search('Yes', read_parameter('Learning Set Task Active', parameters), re.IGNORECASE)
    if learning_parameters['ACTIVE']:
        learning_parameters['TRIALS_PER_PROB'] = float(read_parameter('Learning Set Trials Per Problem', parameters))
        learning_parameters['NUM_PROBS'] = float(read_parameter('Learning Set Number of Problems', parameters))
        learning_parameters['PERCENT'] = float(read_parameter('Learning Set % Correct for Criterion', parameters))
        learning_parameters['RESPONSE'] = float(read_parameter('Learning Set Response Time', parameters))
        learning_parameters['TIMEOUT'] = float(read_parameter('Learning Set Timeout Time', parameters))
        learning_parameters['TITRATION'] = re.search('Yes', read_parameter('Learning Set Titration', parameters), re.IGNORECASE)
        game_list.append('Learning')

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
    fullname = os.path.join(stimuli_dir, name)
    try:
        image = pygame.image.load(fullname)
        while (image.get_width() > 650 or image.get_height() > 300):
            image = pygame.transform.rotozoom(image, 0, 0.9)
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

class Stimuli(pygame.sprite.Sprite):
    def __init__(self, stimuli, x, y):
        pygame.sprite.Sprite.__init__(self)  # call Sprite initializer
        self.image, self.rect = load_image(stimuli, -1)
        self.rect = self.image.get_rect(center=(x,y))

# classes for our game objects
class Target(pygame.sprite.Sprite):
    """moves a pointer on the screen, following the joystick"""
    def __init__(self, background, current_game, diameter):
        self.diameter = int(diameter)
        self.current_game = current_game
        self.velX = random.choice((-5, 5))
        self.velY = random.choice((-5, 5))
        pygame.sprite.Sprite.__init__(self) #call Sprite initializer
        self.image = pygame.Surface([self.diameter,self.diameter])
        self.image.fill((BACKGROUND_COLOR_RGB))
        self.rect = pygame.draw.circle(self.image, GREEN, (int(self.diameter/2),int(self.diameter/2)), int(self.diameter/2), 2)

        self.rect.x = random.randint(0, background.get_width() - self.diameter)
        self.rect.y = random.randint(0, background.get_height() - self.diameter)

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

    def change_color(self, color):
        x = self.rect.x
        y = self.rect.y
        self.rect = pygame.draw.circle(self.image, color, (int(self.diameter/2),int(self.diameter/2)), int(self.diameter/2), 2)

        self.rect.x = x
        self.rect.y = y

    def update(self, background):
        # move based on joystick
        # As long as there is a joystick
        if self.joystick_count != 0:
 
            # This gets the position of the axis on the game controller
            # It returns a number between -1.0 and +1.0
            if (self.current_game == 'Chase'):
                horiz_axis_pos = self.my_joystick.get_axis(0)
                if abs(horiz_axis_pos) < 0.1:
                    horiz_axis_pos = 0
                vert_axis_pos = self.my_joystick.get_axis(1)
                if abs(vert_axis_pos) < 0.1:
                    vert_axis_pos = 0
     
                if (horiz_axis_pos != 0 or vert_axis_pos != 0):
                    self.rect.x = self.rect.x + self.velX;
                    self.rect.y = self.rect.y + self.velY;
            else:
                self.rect.x = self.rect.x + self.velX;
                self.rect.y = self.rect.y + self.velY;

            if self.rect.x >= background.get_width() - (self.diameter+1):
                self.rect.x = background.get_width() - (self.diameter+1)
                self.velX *= -1
            if self.rect.x < 0:
                self.rect.x = 0
                self.velX *= -1
            if self.rect.y >= background.get_height() - (self.diameter+1):
                self.rect.y = background.get_height() - (self.diameter+1)
                self.velY *= -1
            if self.rect.y < 0:
                self.rect.y = 0
                self.velY *= -1

# classes for our game objects
class Pointer(pygame.sprite.Sprite):
    """moves a pointer on the screen, following the joystick"""
    def __init__(self, diameter):
        self.diameter = int(diameter)
        pygame.sprite.Sprite.__init__(self) #call Sprite initializer
        self.image = pygame.Surface([self.diameter,self.diameter])
        self.image.fill(BACKGROUND_COLOR_RGB)
        # self.rect = self.image.get_rect(center=(0, 0))
        self.rect = pygame.draw.circle(self.image, RED, (int(self.diameter/2),int(self.diameter/2)), int(self.diameter/2))

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

    def update(self, background):
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

            if self.rect.x >= background.get_width() - (self.diameter+1):
                self.rect.x = background.get_width() - (self.diameter+1)
            if self.rect.x < 0:
                self.rect.x = 0
            if self.rect.y >= background.get_height() - (self.diameter+1):
                self.rect.y = background.get_height() - (self.diameter+1)
            if self.rect.y < 0:
                self.rect.y = 0


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
    background.fill((BACKGROUND_COLOR_RGB))

    # Display The Background
    screen.blit(background, (0, 0))
    pygame.display.flip()

    # Prepare Game Objects
    clock = pygame.time.Clock()
    incorrect_sound = load_sound('incorrect.wav')
    correct_sound = load_sound('correct.wav')
    pointer = Pointer(24)
    allsprites = pygame.sprite.RenderPlain((pointer))
    pointer.reset(background.get_width()/2, background.get_height()/2)

    current_game = ''

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
    waiting = False
    setup = False
    chosen = False
    gameover = True
    inside = False
    trials = 0
    correct_trials = 0
    problem_trials = 0
    problems = 0
    new_stimuli = True
    start_time = time.time()

    # Main Loop
    going = True
    while going:

        if gameover:
            game_list.remove(current_game)

            if len(game_list) == 0:
                pygame.quit()
                results_file.close()
                sys.exit()

            if re.search('Random', general_parameters['TASKORDER'], re.IGNORECASE):
                current_game = random.choice(game_list)
            else:
                current_game = game_list[0]

            gameover = False

        clock.tick(60)

        # Handle Input Events
        for event in pygame.event.get():
            if event.type == QUIT:
                going = False
            elif event.type == KEYDOWN and event.key == K_ESCAPE:
                going = False

        allsprites.update(background)
        pygame.display.update()

        # Draw Everything
        screen.blit(background, (0, 0))
        allsprites.draw(screen)
        #pygame.display.flip()

        if current_game == 'Side':
            if (time.time() - start_time > side_parameters['RESPONSE']):
                timeout = True
            elif side_level == 1:
                for i in side_wall_list:
                    screen.fill(GREEN, side_walls[i])
                for event in pygame.event.get():
                    if pointer.rect.x != background.get_width()/2 or pointer.rect.y != background.get_height()/2:
                        correct = True
            elif side_level in (2,3,4,5,6):
                for i in side_wall_list:
                    screen.fill(GREEN, side_walls[i])
                    if side_walls[i].colliderect(pointer):
                        correct = True

            if correct or timeout:
                trials += 1
                if correct:
                    correct_trials += 1
                    correct_sound.play()
                    pellet()
                    value = "{}  {}  Correct  {}".format(trials, side_level, time.time() - start_time)
                    time.sleep(3)
                elif timeout:
                    incorrect_sound.play()
                    value = "{}  {}  Timeout  {}".format(trials, side_level, time.time() - start_time)
                    screen.blit(background, (0, 0))
                    pygame.display.update()
                    time.sleep(side_parameters['TIMEOUT'])
                write_event(results_file, current_game, value)
                pointer.reset(background.get_width()/2, background.get_height()/2)
                start_time = time.time() # reset
                correct = False
                timeout = False
                if correct_trials >= side_parameters['TRIALS']:
                    trials = 0
                    correct_trials = 0
                    side_level += 1
                    if side_level > 6: # continue to next stage
                        gameover = True
                if side_level in (1,2):
                    side_wall_list = (0,1,2,3)
                elif side_level == 3:
                    side_wall_list = random_list(0, 3, 3)
                elif side_level == 4:
                    side_wall_list = random_list(0, 3, 2)
                elif side_level == 5:
                    side_wall_list = random_list(0, 3, 1)
                elif side_level == 6:
                    side_wall_list = random_list(4, 7, 1)



        elif current_game == 'Chase':
            if setup:
                if (time.time() - start_time > chase_parameters['RESPONSE']):
                    timeout = True
                elif target.rect.contains(pointer):
                    correct = True
            else:
                if re.search('Small', chase_parameters['CIRCLE_SIZE'], re.IGNORECASE):
                    target_size = 100
                elif re.search('Medium', chase_parameters['CIRCLE_SIZE'], re.IGNORECASE):
                    target_size = 200
                elif re.search('Large', chase_parameters['CIRCLE_SIZE'], re.IGNORECASE):
                    target_size = 300
                target = Target(background, 'Chase', target_size)
                while(target.rect.colliderect(pointer)):
                    newX = random.randInt(0, background.get_width() - pointer.diameter)
                    newY = random.randInt(0, background.get_height() - pointer.diameter)
                    pointer.reset(newX, newY)
                allsprites = pygame.sprite.RenderPlain((target, pointer))
                setup = True

            if correct or timeout:
                trials += 1
                if correct:
                    correct_trials += 1
                    correct_sound.play()
                    pellet()
                    value = "{}  Correct  {}".format(trials, time.time() - start_time)
                    time.sleep(3)
                elif timeout or correct is False:
                    incorrect_sound.play()
                    value = "{}  Timeout  {}".format(trials, time.time() - start_time)
                    screen.blit(background, (0, 0))
                    pygame.display.update()
                    time.sleep(chase_parameters['TIMEOUT'])
                write_event(results_file, current_game, value)
                pointer.reset(background.get_width()/2, background.get_height()/2)
                allsprites = pygame.sprite.RenderPlain((pointer))
                start_time = time.time() # reset
                correct = False
                timeout = False
                setup = False
                if correct_trials >= chase_parameters['TRIALS']:
                    trials = 0
                    correct_trials = 0
                    gameover = True



        elif current_game == 'Pursuit':
            if setup:
                if (time.time() - start_time > pursuit_parameters['RESPONSE']):
                    timeout = True
                elif target.rect.contains(pointer):
                    if inside:
                        target.change_color(GREEN)
                        if (time.time() - start_contains_time >= pursuit_parameters['PURSUIT_TIME']):
                            correct = True
                    else:
                        inside = True
                        start_contains_time = time.time() # reset
                else:
                    target.change_color(RED)
                    inside = False
            else:
                if re.search('Small', pursuit_parameters['CIRCLE_SIZE'], re.IGNORECASE):
                    target_size = 100
                elif re.search('Medium', pursuit_parameters['CIRCLE_SIZE'], re.IGNORECASE):
                    target_size = 200
                elif re.search('Large', pursuit_parameters['CIRCLE_SIZE'], re.IGNORECASE):
                    target_size = 300
                target = Target(background, 'Pursuit', target_size)
                while(target.rect.colliderect(pointer)):
                    newX = random.randint(0, background.get_width() - pointer.diameter)
                    newY = random.randint(0, background.get_height() - pointer.diameter)
                    pointer.reset(newX, newY)
                allsprites = pygame.sprite.RenderPlain((target, pointer))
                setup = True

            if correct or timeout:
                trials += 1
                if correct:
                    correct_trials += 1
                    correct_sound.play()
                    pellet()
                    value = "{}  Correct  {}".format(trials, time.time() - start_time)
                    time.sleep(3)
                elif timeout or correct is False:
                    incorrect_sound.play()
                    value = "{}  Timeout  {}".format(trials, time.time() - start_time)
                    screen.blit(background, (0, 0))
                    pygame.display.update()
                    time.sleep(pursuit_parameters['TIMEOUT'])
                write_event(results_file, current_game, value)
                pointer.reset(background.get_width()/2, background.get_height()/2)
                allsprites = pygame.sprite.RenderPlain((pointer))
                start_time = time.time() # reset
                correct = False
                timeout = False
                setup = False
                if correct_trials >= pursuit_parameters['TRIALS']:
                    trials = 0
                    correct_trials = 0
                    gameover = True



        elif current_game == 'MTS':
            if setup:
                if (time.time() - start_time > mts_parameters['RESPONSE']):
                    timeout = True
                elif stimuli_correct.rect.contains(pointer):
                    correct = True
                    chosen = True
                elif stimuli_wrong.rect.contains(pointer):
                    correct = False
                    chosen = True
            else:
                correct_stimuli = random.choice(os.listdir(stimuli_dir))
                wrong_stimuli = random.choice(os.listdir(stimuli_dir))
                while (correct_stimuli == wrong_stimuli):
                    wrong_stimuli = random.choice(os.listdir(stimuli_dir))
                correct_position = random.choice((0.15, 0.85))
                stimuli_correct = Stimuli(correct_stimuli, background.get_width() * correct_position, background.get_height()/4)
                stimuli_wrong = Stimuli(wrong_stimuli, background.get_width() * (1 - correct_position), background.get_height()/4)
                stimuli_bottom = Stimuli(correct_stimuli, background.get_width()/2, background.get_height()*.8)
                allsprites = pygame.sprite.RenderPlain((stimuli_wrong, stimuli_correct, stimuli_bottom, pointer))
                setup = True

            if chosen or timeout:
                trials += 1
                if correct:
                    correct_trials += 1
                    correct_sound.play()
                    pellet()
                    value = "{}  Correct  {}".format(trials, time.time() - start_time)
                    time.sleep(3)
                elif timeout or correct is False:
                    incorrect_sound.play()
                    value = "{}  Timeout  {}".format(trials, time.time() - start_time)
                    screen.blit(background, (0, 0))
                    pygame.display.update()
                    time.sleep(mts_parameters['TIMEOUT'])
                write_event(results_file, current_game, value)
                pointer.reset(background.get_width()/2, background.get_height()/2)
                allsprites = pygame.sprite.RenderPlain((pointer))
                start_time = time.time() # reset
                correct = False
                timeout = False
                chosen = False
                setup = False
                if correct_trials >= mts_parameters['TRIALS']:
                    if (correct_trials / trials) >= (mts_parameters['PERCENT'] / 100):
                        trials = 0
                        correct_trials = 0
                        gameover = True



        elif current_game == 'DMTS':
            if waiting:
                if setup:
                    if (time.time() - start_time > dmts_parameters['RESPONSE']):
                        timeout = True
                    elif stimuli_correct.rect.contains(pointer):
                        correct = True
                        chosen = True
                    elif stimuli_wrong.rect.contains(pointer):
                        correct = False
                        chosen = True
                else:
                    if stimuli_bottom.rect.contains(pointer):
                        screen.blit(background, (0, 0))
                        pygame.display.update()
                        time.sleep(dmts_parameters['DELAY'])
                        allsprites = pygame.sprite.RenderPlain((stimuli_wrong, stimuli_correct, pointer))
                        setup = True
                        start_time = time.time() # reset
            else:
                correct_stimuli = random.choice(os.listdir(stimuli_dir))
                wrong_stimuli = random.choice(os.listdir(stimuli_dir))
                while (correct_stimuli == wrong_stimuli):
                    wrong_stimuli = random.choice(os.listdir(stimuli_dir))
                correct_position = random.choice([0.15, 0.85])
                stimuli_correct = Stimuli(correct_stimuli, background.get_width() * correct_position, background.get_height()/4)
                stimuli_wrong = Stimuli(wrong_stimuli, background.get_width() * (1 - correct_position), background.get_height()/4)
                stimuli_bottom = Stimuli(correct_stimuli, background.get_width()/2, background.get_height()*.8)
                allsprites = pygame.sprite.RenderPlain((stimuli_bottom, pointer))
                waiting = True

            if chosen or timeout:
                trials += 1
                if correct:
                    correct_trials += 1
                    correct_sound.play()
                    pellet()
                    value = "{}  Correct  {}".format(trials, time.time() - start_time)
                    time.sleep(3)
                elif timeout or correct is False:
                    incorrect_sound.play()
                    value = "{}  Timeout  {}".format(trials, time.time() - start_time)
                    screen.blit(background, (0, 0))
                    pygame.display.update()
                    time.sleep(dmts_parameters['TIMEOUT'])
                write_event(results_file, current_game, value)
                pointer.reset(background.get_width()/2, background.get_height()/2)
                allsprites = pygame.sprite.RenderPlain((pointer))
                start_time = time.time() # reset
                correct = False
                timeout = False
                chosen = False
                waiting = False
                setup = False
                if correct_trials >= dmts_parameters['TRIALS']:
                    if (correct_trials / trials) >= (dmts_parameters['PERCENT'] / 100):
                        trials = 0
                        correct_trials = 0
                        gameover = True



        elif current_game == 'Learning':
            if setup:
                if (time.time() - start_time > learning_parameters['RESPONSE']):
                    timeout = True
                elif stimuli_correct.rect.contains(pointer):
                    correct = True
                    chosen = True
                elif stimuli_wrong.rect.contains(pointer):
                    correct = False
                    chosen = True
            else:
                if new_stimuli:
                    correct_stimuli = random.choice(os.listdir(stimuli_dir))
                wrong_stimuli = random.choice(os.listdir(stimuli_dir))
                while (correct_stimuli == wrong_stimuli):
                    wrong_stimuli = random.choice(os.listdir(stimuli_dir))
                correct_position = random.choice((0.15, 0.85))
                stimuli_correct = Stimuli(correct_stimuli, background.get_width() * correct_position, background.get_height()/2)
                stimuli_wrong = Stimuli(wrong_stimuli, background.get_width() * (1 - correct_position), background.get_height()/2)
                allsprites = pygame.sprite.RenderPlain((stimuli_wrong, stimuli_correct, pointer))
                setup = True
                new_stimuli = False

            if chosen or timeout:
                trials += 1
                problem_trials += 1
                if correct:
                    correct_trials += 1
                    correct_sound.play()
                    pellet()
                    value = "{}  Correct  {}".format(trials, time.time() - start_time)
                    time.sleep(3)
                elif timeout or correct is False:
                    incorrect_sound.play()
                    value = "{}  Timeout  {}".format(trials, time.time() - start_time)
                    screen.blit(background, (0, 0))
                    pygame.display.update()
                    time.sleep(learning_parameters['TIMEOUT'])
                write_event(results_file, current_game, value)
                pointer.reset(background.get_width()/2, background.get_height()/2)
                allsprites = pygame.sprite.RenderPlain((pointer))
                start_time = time.time() # reset
                correct = False
                timeout = False
                chosen = False
                setup = False
                if problem_trials >= learning_parameters['TRIALS_PER_PROB']:
                    problem_trials = 0
                    problems += 1
                    new_stimuli = True
                    if (problems >= learning_parameters['NUM_PROBS']):
                        if (correct_trials / trials) >= (learning_parameters['PERCENT'] / 100):
                            correct_trials = 0
                            trials = 0
                            gameover = True


# this calls the 'main' function when this script is executed
if __name__ == '__main__':
    main()
