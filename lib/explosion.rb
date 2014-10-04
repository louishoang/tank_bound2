class Explosion
  attr_accessor :time, :x, :y
  def initialize(window, x, y)
    @window = window
    @x = x
    @y = y
    @bomb = Gosu::Image.new(@window, "img/boom.png", true)
    @time = 2
  end

  def update
    @time -= 1
  end

  def draw
    10.times { @bomb.draw(x + rand(-10..10), y + rand(-10..10), 20) }
  end
end
