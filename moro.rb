class Moro
  attr_reader :x, :y

  def initialize(x, y)
    @x = x
    @y = y
    @sprite = Gosu::Image.new("moro.jpg")
    @font = Gosu::Font.new(40)
  end

  def draw
    @sprite.draw(@x, @y, 3, 2.2, 2.2)
    @font.draw("GAME OVER!!!", 75, 75, 4, 1.5, 1.5, Gosu::Color::WHITE)
  end
end
