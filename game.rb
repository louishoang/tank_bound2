require 'gosu'
require 'pry'
require 'date'
require_relative 'lib/player'
require_relative 'lib/keys'
require_relative 'lib/bounding_box'
require_relative 'lib/bullet'


class GameWindow < Gosu::Window

  SCREEN_WIDTH = 1072
  SCREEN_HEIGHT = 720

  attr_accessor :player1, :player2, :width
  include Keys

  def initialize
    super(SCREEN_WIDTH, SCREEN_HEIGHT, false)
    self.caption = "TankBound"
    @player1 = Player.new(self, 40, SCREEN_HEIGHT - 50, "img/boy.png", "player1", 0)
    @player2 = Player.new(self, SCREEN_WIDTH - 40, SCREEN_HEIGHT - 50, "img/girl.png", "player2", 10)
    @bg_img = Gosu::Image.new(self, 'img/bg.jpg', true)
    @font = Gosu::Font.new(self, Gosu::default_font_name, 50)
    @bg_music = Gosu::Song.new(self, "media/ready.wav")
    @bg_music.play(true)
    @bullets1 = []
    @bullets2 = []
  end

  def update
    @player1.update
    @player2.update
    if button_down? Gosu::Button::KbSpace
      @bullets1 << @player1.fire(@player1, @player1.x + 6, "img/bullet1.png")
    end
    if button_down? Gosu::Button::KbRightShift
      @bullets2 << @player2.fire(@player2, @player2.x - 25, "img/bullet2.png")
    end
    @bullets1.each do |bullet|
      bullet.update
      if @player2.collide?(bullet.x, bullet.y)
        @player2.minus_health
      end
    end

    @bullets2.each do |bullet|
      bullet.update
      if @player1.collide?(bullet.x, bullet.y)
        @player1.minus_health
      end
    end
  end

  def draw
    @bg_img.draw(0, 0, 0)
    @player1.draw
    @player2.draw
    draw_helper

    # Game Over
    if @player1.health <= 0 || @player2.health <= 0
      @font.draw("GAME OVER", 250, 300, 100, 2.0, 2.0, 0xffffffff)
    end
  end

  def draw_helper
    @bullets1.each {|bullet| bullet.draw}
    @bullets2.each {|bullet| bullet.draw}
    @font.draw("Player 1", 30, 10, 1, 1.0, 1.0, 0xffffff00)
    @font.draw("#{player1.health}", 60, 50, 1, 1.0, 1.0, 0xffffff00)
    @font.draw("Player 2", 880, 10, 1, 1.0, 1.0, 0xffffff00)
    @font.draw("#{player2.health}", 950, 50, 1, 1.0, 1.0, 0xffffff00)
  end
end

GameWindow.new.show
