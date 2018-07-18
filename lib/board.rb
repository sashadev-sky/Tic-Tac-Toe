class Board
  attr_accessor :grid, :marks

  def initialize(grid = Array.new(3) { Array.new(3) })
    @grid = grid
    @marks = [:X, :O]
  end

  def place_mark(position, mark)
    row = position[0]
    col = position[1]
    unless empty?(position)
      raise "This position is taken"
    end
    @grid[row][col] = mark
  end

  def empty?(position)
    row = position[0]
    col = position[1]
    @grid[row][col] == nil
  end

end
