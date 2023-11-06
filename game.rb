require 'gosu'

require_relative 'worm'
require_relative 'food'
require_relative 'menu'

class WormsGame < Gosu::Window
  def initialize
    super(800, 600) # Create a window with the specified dimensions

    self.caption = "Worms, the game"

    @game_started = true # Set to `false` to go to the start menu
    @start_menu = StartMenu.new

    @worm = Worm.new(5, 5, 5)  # Initial worm position and length
    @food = Food.new(rand(0..width), rand(0..height)) # Initial food position
  end

  def update
    if @game_started
      @worm.move

      if @worm.collect_food(@food)
        @food = Food.new(rand(0..width), rand(0..height))  # Create new food when eaten
      end

      # Implement collision detection and game over conditions here
    else
      # Handle input to start the game
      start_game if button_down?(Gosu::KB_RETURN)
      exit if button_down?(Gosu::KB_ESCAPE)
    end
  end


  def button_down(id)
    case id
    when Gosu::KB_RIGHT
      @worm.direction = :right
    when Gosu::KB_LEFT
      @worm.direction = :left
    when Gosu::KB_UP
      @worm.direction = :up
    when Gosu::KB_DOWN
      @worm.direction = :down
    end
  end

  def draw
    if @game_started
      # Render the worm, food, and other game objects here
      @worm.draw
      @food.draw
    else
      @start_menu.draw
    end
  end

  def start_game
    @game_started = true
    # Initialize game objects, worms, food, etc.
  end
end

game = WormsGame.new
game.show