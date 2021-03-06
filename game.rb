#!/usr/bin/env ruby -w
require 'gosu'
require 'pry'
require 'date'
require_relative 'lib/player'
require_relative 'lib/keys'
require_relative 'lib/bounding_box'
require_relative 'lib/bullet'
require_relative 'lib/explosion'
require_relative 'lib/castle'

class GameWindow < Gosu::Window

  SCREEN_WIDTH = 1072
  SCREEN_HEIGHT = 720

  attr_accessor :player1, :player2, :width, :castle
  include Keys

  def initialize
    super(SCREEN_WIDTH, SCREEN_HEIGHT, false)
    self.caption = "TankBound"
    @font = Gosu::Font.new(self, Gosu::default_font_name, 50)
    @font2 = Gosu::Font.new(self, Gosu::default_font_name, 20)
    load_bullet_and_explosion
    load_image_and_sound
  end

  def update
    if playing
      @player1.update
      @player2.update
      press_and_hold_button
      player1_bullet
      player2_bullet
      bomb_explosion
      @castle.update
    end
  end

  def draw
    drawer_main_character
    draw_motion
    draw_font
    draw_game_over
    draw_castle
  end

  def load_bullet_and_explosion
    @bullets1 = []
    @bullets2 = []
    @booms = []
  end

  def bomb_explosion
    @booms.each do |boom|
      boom.update
      if boom.time == 0
        @booms.delete(boom)
      end
    end
  end

  def player2_bullet
    @bullets2.each do |bullet|
      bullet.update if bullet.alive?
      if @player1.collide?(bullet.x, bullet.y)
        @player1.minus_health
        @booms << bullet.explode(@player1.x , @player1.y )
        @bullets2.delete(bullet)
      elsif
        @castle.collide?(bullet.x, bullet.y)
        @castle.minus_health
        @booms << bullet.explode(bullet.x , bullet.y)
        @bullets2.delete(bullet)
      end
    end
  end

  def player1_bullet
    @bullets1.each do |bullet|
      bullet.update if bullet.alive?
      if @player2.collide?(bullet.x, bullet.y)
        @player2.minus_health
        @booms << bullet.explode(@player2.x , @player2.y)
        @bullets1.delete(bullet)
      elsif
        @castle.collide?(bullet.x, bullet.y)
        @castle.minus_health
        @booms << bullet.explode(bullet.x , bullet.y)
        @bullets1.delete(bullet)
      end
    end
  end

  def press_and_hold_button
    if button_down? Gosu::Button::KbSpace
      @bullets1 << @player1.fire(@player1, @player1.x + 6, "img/bullet1.png")
    end
    if button_down? Gosu::Button::KbRightShift
      @bullets2 << @player2.fire(@player2, @player2.x - 25, "img/bullet2.png")
    end
  end

  def draw_game_over
    if @player1.health <= 0 || @player2.health <= 0
      @font.draw("GAME OVER", 250, 300, 100, 2.0, 2.0, 0xffffffff)
      @font2.draw("Press T to restart", 375, 400, 100, 2.0, 2.0, 0xffffffff)
    end
  end

  def draw_castle
    if castle.alive?
      castle.draw
    end
  end

  def drawer_main_character
    @bg_img.draw(0, 0, 0)
    @player1.draw
    @player2.draw
  end

  def draw_motion
    @booms.each {|boom| boom.draw}
    @bullets1.each {|bullet| bullet.draw}
    @bullets2.each {|bullet| bullet.draw}
  end

  def draw_font
    @font.draw("Player 1", 30, 10, 1, 1.0, 1.0, 0xff0000ff)
    @font.draw("#{player1.health}", 60, 50, 1, 1.0, 1.0, 0xff0000ff)
    @font.draw("Player 2", 880, 10, 1, 1.0, 1.0, 0xffff0000)
    @font.draw("#{player2.health}", 925, 50, 1, 1.0, 1.0, 0xffff0000)
    @font.draw("#{castle.health}", 500, 650, 10, 1.0, 1.0, 0xffffff00) if castle.alive?
  end

  def load_image_and_sound
    @player1 = Player.new(self, 40, SCREEN_HEIGHT - 50, "img/boy.png", "player1", 0)
    @player2 = Player.new(self, SCREEN_WIDTH - 40, SCREEN_HEIGHT - 50, "img/girl.png", "player2", 10)
    @castle = Castle.new(self, 300, 470)
    @bg_img = Gosu::Image.new(self, 'img/bg.jpg', true)
    @bg_music = Gosu::Song.new(self, "media/ready.wav")
    @bg_music.play(true)
  end

  def playing
    player1.alive? && player2.alive?
  end
end

GameWindow.new.show
