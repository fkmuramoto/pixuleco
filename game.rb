require 'gosu'
require_relative 'player'
require_relative 'money'
require_relative 'moro'


class Pixuleco < Gosu::Window
  def initialize
    super(1000, 500)
    self.caption = "Pixuleco"
    @background_image = Gosu::Image.new("wallpaper.jpg", :tileable => true)
    @player = Player.new(0, 0, 340)
    @money_bag = []
    @money_wasted = 5
    @moro = Moro.new(0, -150)
    @font = Gosu::Font.new(40)
  end

  def update
    @player.update
      @money_bag.each do |money|
        money.update

        if @player.money(money)
          @money_bag.delete(money)
        end

        if money.money_wasted?
          @money_wasted -= 1
          @money_bag.delete(money)
        end
      end
    if rand(100) < 1
      @money_bag << Money.new
    end
  end

  def draw
    @background_image.draw(0, 0, 0, 0.5, 0.5)
    @font.draw("Vidas: #{@money_wasted}", 25, 25, 2, 1, 1, Gosu::Color::RED)
    @player.draw
    @money_bag.each { |money| money.draw }
    if @money_wasted <= 0
      @moro.draw
    end

  end
end

Pixuleco.new.show
