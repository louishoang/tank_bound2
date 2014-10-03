module BoundingBox
  attr_reader :left, :bottom, :width, :height, :right, :top

  def bounding(left, bottom, width, height)
    @left = left
    @bottom = bottom
    @width = width
    @height = height

    @right = @left + @width
    @top = @bottom + @height
  end
end
