class StartMenu
  def initialize
    @font = Gosu::Font.new(48, name: 'Arial')
  end

  def draw
    @font.draw_text("Worms Game", 280, 200, 1, 1, 1, Gosu::Color::WHITE)
    @font.draw_text("Press 'Enter' to start", 240, 300, 1, 1, 1, Gosu::Color::WHITE)
    @font.draw_text("Press 'Esc' to exit", 260, 400, 1, 1, 1, Gosu::Color::WHITE)
  end
end