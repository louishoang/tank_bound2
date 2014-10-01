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
  end

  def update
    if @player.name == "player1"
      @x += 3
      @y += @angle
    else
      @x -= 3
      @y -= @angle
    end
  end

  def draw
    @bullet1_img.draw(@x, @y, 2)
    @bullet2_img.draw(@x, @y, 2)
  end
end
