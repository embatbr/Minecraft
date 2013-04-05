# pyCraftr

![pyCraftr](https://raw.github.com/ronmurphy/Minecraft/master/screenshot.png)

**Simple Minecraft-inspired demo written in Python and Pyglet.**

*http://www.youtube.com/watch?v=kC3lwK631X8*

## How to Run

    pip install pyglet
    git clone https://github.com/ronmurphy/Minecraft.git
    cd Minecraft
    python main.py

### Mac

On **Mac OS X**, you may have an issue with running **Pyglet in 64-bit mode**. Try running **Python in 32-bit mode** first:

    arch -i386 python main.py

If that doesn't work, set **Python to run in 32-bit mode by default**:

    defaults write com.apple.versioner.python Prefer-32-Bit -bool yes

This assumes you are **using the OS X default Python**. Works on **Lion 10.7 with the default Python 2.7**, and may work on other versions too. Please raise an issue if not.

Or try **Pyglet 1.2 alpha**, which **supports 64-bit mode**:

    pip install https://pyglet.googlecode.com/files/pyglet-1.2alpha1.tar.gz

### If you don't have pip or git

### Windows Pyglet builds
    See this website, and download the correct version for the OS.
    This is important to get this, as how it will have AVBin included with it.

    http://www.lfd.uci.edu/~gohlke/pythonlibs/#pyglet
        For a 32 bit Windows Os, get the file named "pyglet-1.2alpha1.win32-py2.7.‌exe"
        For a 64 bit Windows Os, get the file named "pyglet-1.2alpha1.win-amd64-py2.7.‌exe"

For pip:

- **Mac or Linux**: install with `sudo easy_install pip` (Mac or Linux) or (Linux) find a package called something like 'python-pip' in your package manager.
- **Ubuntu**: install with `sudo apt-get install python-pip`
- **Windows**: [install Distribute then Pip](http://stackoverflow.com/a/12476379/992887) using the linked .MSI installers.

For git:

- **Mac**: install [Homebrew](http://mxcl.github.com/homebrew/) first, then `brew install git`.
- **Windows or Linux**: see [Installing Git](http://git-scm.com/book/en/Getting-Started-Installing-Git) from the _Pro Git_ book.

*See the [wiki](https://github.com/fogleman/Minecraft/wiki) for this project to install Python, and other tips.*

## How to Play

### Moving

- **W**: forward
- **S**: back
- **A**: strafe left
- **D**: strafe right
- **Mouse**: look around
- **Space**: jump / (in flying mode) fly
- **Shift**: (in flying mode) fly down
- **Tab**: toggle flying mode

### Building

- **1 - 9**: Selecting item in inventory
- **Mouse left-click**: remove block
- **Mouse right-click**: create block

### GUI

- **B / F3**: Toggle UI
- **E**: Show inventory
- **V**: Saving (save filename in command-line arguments)
- **ENTER**: Move selected item to inventory / quick slots
- **Mouse left-click (in inventory)**: Pick up item and after second click put off last item

### Quitting

- **ESC**: release mouse, then close window

### Command-line arguments
    usage: main.py [-h] [-width WIDTH] [-height HEIGHT]
               [-terrain {plains,island,desert,snow,mountains}]
               [-hillheight HILLHEIGHT] [-worldsize WORLDSIZE]
               [-maxtrees MAXTREES] [--flat] [--hide-fog] [--show-gui]
               [--disable-auto-save] [-draw-distance {short,medium,long}]
               [-save SAVE] [--disable-save] [--fast] [--save-config]
               [-fullscreen]

    Play a Python made Minecraft clone.

    optional arguments:
      -h, --help            show this help message and exit
      -width WIDTH          Set the default Widht.
      -height HEIGHT        Set the default Height.
      -terrain {plains,island,desert,snow,mountains}
                            Different terains. Choose grass, island,
                            mountains,desert, plains
      -hillheight HILLHEIGHT
                            How high the hills are.
      -worldsize WORLDSIZE  The width size of the world.
      -maxtrees MAXTREES    How many trees and cacti should be made.
      --flat                Generate a flat world.
      --hide-fog            Hides the fog, see the whole landscape.
      --show-gui            Enabled by default.
      --disable-auto-save   Do not save world on exit.
      -draw-distance {short,medium,long}
                            How far to draw the map. Choose short, medium or long.
      -save SAVE            Type a name for the world to be saved as.
      --disable-save        Disables saving.
      --fast                Makes time progress faster then normal.
      --save-config         Saves the choices as the default config.
      -fullscreen           Runs the game in fullscreen. Press 'Q' to exit the game.
