require 'gosu'

class Player
  JUMP_SPEED = -15
  GRAVITY_SPEED = 1
  FLOOR = 340

  def initialize(life, x, y)
    @life = life
    @x = x
    @y = y
    @sprite = Gosu::Image.new("pixuleco.png")
    @right = true
    @speed_y = 0
    @speed_x = 6
  end

  def update
    if Gosu.button_down?(Gosu::KB_RIGHT)
      @x += @speed_x
      @right = true
    elsif Gosu.button_down?(Gosu::KB_LEFT)
      @x -= @speed_x
      @right = false
    end

    if Gosu.button_down?(Gosu::KB_UP) && @y == FLOOR
      @speed_y = JUMP_SPEED
    end

    @y += @speed_y
    @speed_y += GRAVITY_SPEED if @y != FLOOR

    if @y > FLOOR
      @speed_y = 0
      @y = FLOOR
    end
  end

  def draw
    if @right
      @sprite.draw(@x, @y, 1, 0.10, 0.10)
    else
      @sprite.draw(@x + 100, @y, 1, -0.10, 0.10)
    end
  end

  def width
    @sprite.width * 0.10
  end

  def right
    width + @x
  end

  def height
    @sprite.height * 0.10
  end

  def bottom
    @y + height
  end

  def money(money)
    (money.x > @x && money.x < right) &&
    (money.y > @y && money.y < bottom)
  end
end
