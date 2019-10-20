import os, pygame, argparse, re, sys

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
        side_parameters['TRIALS'] = read_parameter('Side Task Trials to Criterion', parameters)
        side_parameters['TIMEOUT'] = read_parameter('Side Task Timeout Time', parameters)
        side_parameters['TITRATION'] = re.search('Yes', read_parameter('Side Task Titration', parameters), re.IGNORECASE)
        side_parameters['START_LEVEL'] = read_parameter('Side Start Level', parameters)

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
            colorkey = image.get_at((0, 0))
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
        self.image, self.rect = load_image('pointer.bmp', -1)
        self.clicking = 0

    def update(self):
        """move the pointer based on the mouse position"""
        pos = pygame.mouse.get_pos()
        self.rect.midtop = pos
        if self.clicking:
            self.rect.move_ip(5, 10)

    def click(self, target):
        """returns true if the pointer collides with the target"""
        if not self.clicking:
            self.clicking = 1
            hitbox = self.rect.inflate(-5, -5)
            return hitbox.colliderect(target.rect)

    def unclick(self):
        """called to pull the pointer back"""
        self.clicking = 0


class Chimp(pygame.sprite.Sprite):
    """moves a monkey critter across the screen. it can spin the
       monkey when it is clicked."""
    def __init__(self):
        pygame.sprite.Sprite.__init__(self)  # call Sprite intializer
        self.image, self.rect = load_image('chimp.bmp', -1)
        screen = pygame.display.get_surface()
        self.area = screen.get_rect()
        self.rect.topleft = 10, 10
        self.move = 9
        self.dizzy = 0

    def update(self):
        """walk or spin, depending on the monkeys state"""
        if self.dizzy:
            self._spin()
        else:
            self._walk()

    def _walk(self):
        """move the monkey across the screen, and turn at the ends"""
        newpos = self.rect.move((self.move, 0))
        if not self.area.contains(newpos):
            if self.rect.left < self.area.left or \
                    self.rect.right > self.area.right:
                self.move = -self.move
                newpos = self.rect.move((self.move, 0))
                self.image = pygame.transform.flip(self.image, 1, 0)
            self.rect = newpos

    def _spin(self):
        """spin the monkey image"""
        center = self.rect.center
        self.dizzy = self.dizzy + 12
        if self.dizzy >= 360:
            self.dizzy = 0
            self.image = self.original
        else:
            rotate = pygame.transform.rotate
            self.image = rotate(self.original, self.dizzy)
        self.rect = self.image.get_rect(center=center)

    def clicked(self):
        """this will cause the monkey to start spinning"""
        if not self.dizzy:
            self.dizzy = 1
            self.original = self.image

"""this function is called when the program starts.
       it initializes everything it needs, then runs in
       a loop until the function returns."""
def main():
    load_and_check_params(args.parameter_file)

    # Initialize Everything
    pygame.init()
    screen = pygame.display.set_mode((0, 0), pygame.FULLSCREEN)
    pygame.display.set_caption('Monkey Fever')
    pygame.mouse.set_visible(0)

    # Create The Backgound
    background = pygame.Surface(screen.get_size())
    background = background.convert()
    background.fill((250, 250, 250))

    # Put TextCustom On The Background, Centered
    if pygame.font:
        font = pygame.font.Font(None, 36)
        text = font.render("Pummel The Chimp, And Win $$$", 1, (10, 10, 10))
        textpos = text.get_rect(centerx=background.get_width()/2)
        background.blit(text, textpos)

    # Display The Background
    screen.blit(background, (0, 0))
    pygame.display.flip()

    # Prepare Game Objects
    clock = pygame.time.Clock()
    incorrect_sound = load_sound('incorrect.wav')
    correct_sound = load_sound('correct.wav')
    chimp = Chimp()
    pointer = Pointer()
    allsprites = pygame.sprite.RenderPlain((pointer, chimp))

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
            elif event.type == MOUSEBUTTONDOWN:
                if pointer.click(chimp):
                    correct_sound.play()  # click
                    chimp.clicked()
                else:
                    incorrect_sound.play()  # miss
            elif event.type == MOUSEBUTTONUP:
                pointer.unclick()

        allsprites.update()

        # Draw Everything
        screen.blit(background, (0, 0))
        allsprites.draw(screen)
        pygame.display.flip()

    pygame.quit()

# Game Over


# this calls the 'main' function when this script is executed
if __name__ == '__main__':
    main()