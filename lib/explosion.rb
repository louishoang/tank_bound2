class Explosion
  def initialize(window, x, y)
    @window = window
    @x = x
    @y = y
    @boom = Gosu::Image.new(@window, "img/boom.png", true)
  end

  def update
    @boom.update
  end

  def draw
    @boom.draw(@x, @y, 2)
  end
end
