module Keys

  def button_down(id)
    # Button for player_1(boy)
    if id == Gosu::KbA
      @player1.m_left = true
    elsif id == Gosu::KbD
      @player1.m_right = true
    elsif id == Gosu::KbW
      @player1.m_rotate_up = true
    elsif id == Gosu::KbS
      @player1.m_rotate_down = true

    # Button for player_2(girl)
    elsif id == Gosu::KbLeft
      @player2.m_left = true
    elsif id == Gosu::KbRight
      @player2.m_right = true
    elsif id == Gosu::KbUp
      @player2.m_rotate_up_reversed = true
      @position = "right"
    elsif id == Gosu::KbDown
      @player2.m_rotate_down_reversed = true
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

end
