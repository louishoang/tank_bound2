class Bullet
  attr_accessor :x, :y

  def initialize(window, player, x, icon)
    @window = window
    @bullet1_img = Gosu::Image.new(@window, icon, false)
    @bullet2_img = Gosu::Image.new(@window, icon, false)
    @player = player
    @x = x
    @y = player.y
    @angle = player.angle
    @power1 = 12
    @power = 14 #defaut 12
    @gravity = 20
    @height = 0.5
  end

  def update
    if @player.name == "player1"
      if @power1 > 0
        @x += @power1 + (@angle * 0.01)
        @y += (-(@gravity / 2) + @power1 * (@angle * 0.007)) - @height
        @power1 -= 0.01
        @gravity -= 1
        @height += 0.1
      end
    else
      if @power > 0
        @x -= @power + (@angle * 0.01)
        @y += (-(@gravity / 2) + @power * (-@angle * 0.007)) + @height
        @power -= 0.01
        @gravity -= 1
        @height += 0.015
      end
    end
  end

  def draw
    @bullet1_img.draw(@x, @y, 2)
    @bullet2_img.draw(@x, @y, 2)
  end
end
