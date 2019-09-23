import os, pygame

# pip install pysimplegui
import PySimpleGUI as sg

# pip install pygame --user
from pygame.locals import *
from pygame.compat import geterror

if not pygame.font: print('Warning, fonts disabled')
if not pygame.mixer: print('Warning, sound disabled')

# read animal IDs from file
animal_id_file = open("AnimalIDS.txt", "r")
lines = animal_id_file.readlines()
animal_id_file.close()

games = ['Chase', 'Pursuit', 'Side', 'DMTS', 'LS', 'MTS']

main_dir = os.path.split(os.path.abspath(__file__))[0]
data_dir = os.path.join(main_dir, 'data')

# All the stuff inside your window. 
layout = [  [sg.Text('Subject ID:', font = ('Arial', 40, 'bold'), pad = ((10, 10), (80, 10)))],
            [sg.Combo(lines, font = ('Arial', 40, 'bold'), auto_size_text = False, size = (25, 100), pad = ((10, 10), (10, 10)))],
            [sg.Text('Game:', font = ('Arial', 40, 'bold'), pad = ((10, 10), (80, 10)))],
            [sg.Combo(games, font = ('Arial', 40, 'bold'), auto_size_text = False, size = (25, 100), pad = ((10, 10), (10, 100)))],
            [sg.Button('Start', font = ('Arial', 40, 'bold'), size = (5, 1), pad = ((300, 10), (10, 100)))]
         ]


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


def main():

    # Create the Window
    window = sg.Window('CDC Cognitive Testing', layout)
    # Event Loop to process "events" and get the "values" of the inputs
    while True:             
        event, values = window.read()
        if event in ([None]):   # if user closes window
            window.close()
            sys.exit()
        if event in (['Start']):
            break

    window.close()

    """this function is called when the program starts.
       it initializes everything it needs, then runs in
       a loop until the function returns."""
    # Initialize Everything
    pygame.init()
    screen = pygame.display.set_mode((0, 0), pygame.FULLSCREEN)
    pygame.display.set_caption('Monkey Fever')
    pygame.mouse.set_visible(0)

    # Create The Backgound
    background = pygame.Surface(screen.get_size())
    background = background.convert()
    background.fill((250, 250, 250))

    # Put Text On The Background, Centered
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