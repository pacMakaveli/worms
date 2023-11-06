class Food
  attr_accessor :x, :y

  module ZOrder
    BACKGROUND = 0
    FOOD       = 1
    WORM       = 2
    UI         = 3
  end

  def initialize(x, y)
    @x = x
    @y = y
  end

  def draw
    radius = 5
    color = Gosu::Color::RED
    segments = 32
    angle_step = 360.0 / segments

    prev_x = @x * 10 + Math.cos(0) * radius
    prev_y = @y * 10 + Math.sin(0) * radius

    segments.times do |i|
      angle = i * angle_step
      cur_x = @x * 10 + Math.cos(angle) * radius
      cur_y = @y * 10 + Math.sin(angle) * radius

      Gosu.draw_line(prev_x, prev_y, color, cur_x, cur_y, color, ZOrder::FOOD)
      prev_x = cur_x
      prev_y = cur_y
    end
  end
end