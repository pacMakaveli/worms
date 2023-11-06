class Worm
  attr_accessor :x, :y, :length, :direction

  def initialize(x, y, length = 5)
    @x = x
    @y = y
    @length = length
    @direction = :right
  end

  def move
    case direction
    when :right
      @x += 1
    when :left
      @x -= 1
    when :up
      @y -= 1
    when :down
      @y += 1
    end
  end

  def collect_food(food)
    if (food.x - @x).abs <= 1 && (food.y - @y).abs <= 1
      # If the worm is close enough to the food, "eat" it and increase its length
      @length += 1
      true
    else
      false
    end
  end

  def collide_with_other_worms
    # Check for collisions with other worms
  end

  def draw
    segment_size = 10
    Gosu.draw_rect(@x * segment_size, @y * segment_size, segment_size, segment_size, Gosu::Color::GREEN)
  end
end