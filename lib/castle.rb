require_relative 'bounding_box'
class Castle
  include BoundingBox
  attr_accessor :health, :x, :y, :hit
  def initialize(window, x, y)
    @window = window
    @x = x
    @y = y
    @icon = Gosu::Image.new(@window, "img/castle.png", true)
    bounding(@x + 100, @y + 75, 250, 200)
    @health = 1000
    @beep = Gosu::Sample.new(window, "media/explosion.wav")
    @hit = 0
  end

  def update
    if !alive?
      bounding(@x, @y + 1000, 300, 300)
    else
      bounding(@x + 100, @y + 75 + @hit, 250, 200)
    end
  end

  def draw
    @icon.draw(x, y, 2)
  end

  def minus_health
    @hit += 0.0005
    @y += @hit
    @health -= 1
    @beep.play
  end

  def collide?(x,y)
    if x >= @left && x <= @right && y >= @bottom && y <= @top
      true
    else
      false
    end
  end

  def alive?
    @health > 0
  end
end
