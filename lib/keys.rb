module Keys
  def button_down(id)
    # Button for player_1(boy)
    if id == Gosu::KbA
      @player1.m_left = true
    elsif id == Gosu::KbD
      if @castle.alive? && @player1.x < 300 + @castle.hit * 1000
        @player1.m_right = true
      elsif !@castle.alive?
        @player1.m_right = true
      end
    elsif id == Gosu::KbW
      @player1.m_rotate_up = true
    elsif id == Gosu::KbS
      @player1.m_rotate_down = true

    # Button for player_2(girl)
    elsif id == Gosu::KbLeft
      if @castle.alive? && @player2.x > 800 - @castle.hit * 1000
        @player2.m_left = true
      elsif !@castle.alive?
        @player2.m_left = true
      end
    elsif id == Gosu::KbRight
        @player2.m_right = true
    elsif id == Gosu::KbUp
      @player2.m_rotate_up_reversed = true
      @position = "right"
    elsif id == Gosu::KbDown
      @player2.m_rotate_down_reversed = true

    # Button for main game
    elsif id == Gosu::KbT
      reset_game
    end
  end

  def button_up(id)
    # Button for player_1(boy)
    if id == Gosu::KbA
      @player1.m_left = false
    elsif id == Gosu::KbD
      @player1.m_right = false
    elsif id == Gosu::KbW
      @player1.m_rotate_up = false
    elsif id == Gosu::KbS
      @player1.m_rotate_down = false

    # Button for player_2(girl)
    elsif id == Gosu::KbLeft
      @player2.m_left = false
    elsif id == Gosu::KbRight
      @player2.m_right = false
    elsif id == Gosu::KbUp
      @player2.m_rotate_up_reversed = false
    elsif id == Gosu::KbDown
      @player2.m_rotate_down_reversed = false
    end
  end

  def reset_game
    reset_player
    reset_bullet
    delete_explosion
    reset_castle
  end

  def delete_explosion
    while @booms.size > 0
      @booms.each do |boom|
        @booms.delete(boom)
      end
    end
  end

  def reset_player
    @player1.health = 100
    @player1.x = 40
    @player1.angle = 0
    @player2.health = 100
    @player2.x = 1032
    @player2.angle = 0
  end

  def reset_bullet
    reset_player1_bullet
    reset_player2_bullet
  end

  def reset_player1_bullet
    while @bullets1.size > 0
      @bullets1.each do |bullet|
        @bullets1.delete(bullet)
      end
    end
  end

  def reset_player2_bullet
    while @bullets2.size > 0
      @bullets2.each do |bullet|
        @bullets2.delete(bullet)
      end
    end
  end

  def reset_castle
    @castle.y = 470
    @castle.health = 900
    @castle.hit = 0
  end
end
