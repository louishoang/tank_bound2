require_relative 'bounding_box'
require_relative 'castle'

class Player

  include BoundingBox
  attr_accessor :x, :y, :angle, :m_left, :m_right, :m_rotate_up, :m_rotate_down,
                :m_rotate_up_reversed, :m_rotate_down_reversed, :fire, :name,
                :health

  def initialize(window, x, y, img, name, adjust)
    @adjust = adjust
    @name = name
    @angle = 0
    @health = 100
    @window = window
    @x = x
    @y = y
    initialize_movement
    bounding(@x - 32 + @adjust, @y, 45, 45)
    @icon = Gosu::Image.new(@window, img, true)
    @beep = Gosu::Sample.new(window, "media/explosion.wav")
  end

  def draw
    @icon.draw_rot(x, y, 1, @angle, 0.5, 0.5)
  end

  def update
    if m_left
      unless x <= 15
        @x -= 1
      end
    elsif m_right
      unless x >= 1057
        @x += 1
      end
    elsif m_rotate_up
      if @angle <= 91 && @angle > -90
        @angle -= 1
      end
    elsif m_rotate_down
      if @angle <= 90 && @angle >= -91
        @angle += 1
      end
    elsif m_rotate_up_reversed
      if @angle >= -91 && @angle <= 90
        @angle += 1
      end
    elsif m_rotate_down_reversed
      if @angle > -90 && @angle <= 91
        @angle -= 1
      end
    end

    bounding(@x - 32 + @adjust, @y, 45, 45)
  end

  def initialize_movement
    @m_right = false
    @m_left = false
    @m_rotate_up = false
    @m_rotate_down = false
  end

  def fire(x, y, icon)
    Bullet.new(@window, x, y, icon)
  end

  def minus_health
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
