require 'gosu'
require 'pry'
require 'date'
require_relative 'player'
require_relative 'lib/keys'


class GameWindow < Gosu::Window

  SCREEN_WIDTH = 1072
  SCREEN_HEIGHT = 720

  attr_accessor :player1, :player2, :width, :position
  include Keys

  def initialize
    super(SCREEN_WIDTH, SCREEN_HEIGHT, false)
    self.caption = "TankBound"
    @player1 = Player.new(self, 40, SCREEN_HEIGHT - 50, "img/boy.png")
    @player2 = Player.new(self, SCREEN_WIDTH - 40, SCREEN_HEIGHT - 50, "img/girl.png")
    @bg_img = Gosu::Image.new(self, 'img/bg.jpg', true)
    @position = "left"

  end

  def update
    @player1.update
    @player2.update
  end

  def draw
    @bg_img.draw(0, 0, 0)
    @player1.draw
    @player2.draw
  end
end

GameWindow.new.show
