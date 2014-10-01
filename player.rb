class Player
  attr_accessor :x, :y, :angle, :m_left, :m_right, :m_rotate_up, :m_rotate_down,
                :m_rotate_up_reversed, :m_rotate_down_reversed
  def initialize(window, x, y, img)
    @window = window
    @x = x
    @y = y
    @angle = 0
    @icon = Gosu::Image.new(@window, img, true)
    @m_right = false
    @m_left = false
    @m_rotate_up = false
    @m_rotate_down = false
  end

  def draw
    @icon.draw_rot(x, y, 1, @angle, 0.5, 0.5)
  end

  def update
    if m_left
      unless x <= 15
        @x -= 0.5
      end
    elsif m_right
      unless x >= 1057
        @x += 0.5
      end
    elsif m_rotate_up
      if @angle <= 0 && @angle >= -90
        @angle -= 1
      end
    elsif m_rotate_down
      if @angle <= -1 && @angle >= -91
        @angle += 1
      end
    elsif m_rotate_up_reversed
      if @angle >= -1 && @angle <= 90
        @angle += 1
      end
    elsif m_rotate_down_reversed
      if @angle >= 0 && @angle <= 91
        @angle -= 1
      end
    end
  end

end
