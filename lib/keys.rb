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
    # elsif id == Gosu::KbSpace
    #   @bullets1 << @player1.fire(@player1, @player1.x + 6, "img/bullet1.png")
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
    # elsif id == Gosu::KbRightShift
    #   @bullets2 << @player2.fire(@player2, @player2.x - 25, "img/bullet2.png")
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
