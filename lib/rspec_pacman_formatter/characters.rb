
require 'colorize'

module RspecPacmanFormatter
  class Characters
    BLINKY = 'ᗣ'.light_red
    PINKY  = 'ᗣ'.light_magenta
    INKY   = 'ᗣ'.light_blue
    CLYDE  = 'ᗣ'.yellow
    PACMAN = 'ᗧ'.light_yellow
    PACDOT = '•'.light_yellow

    def self.random_ghost
      [BLINKY, PINKY, INKY, CLYDE].sample
    end
  end
end
