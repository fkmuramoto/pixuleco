class Money
  FLOOR = 500
  attr_reader :x, :y

  def initialize
    @x = rand(800)
    @y = 0
    @angle = rand(360)
    @sprite = Gosu::Image.new("money.png")
  end

  def update
    @y += 2
  end

  def money_wasted?
    @y >= FLOOR
  end

  def draw
    @sprite.draw_rot(@x, @y, 0, @angle, 0.5, 0.5, 0.3, 0.3)
  end
end
