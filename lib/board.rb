class Board
  attr_accessor :grid, :marks

  def initialize(grid = Array.new(3) { Array.new(3) })
    @grid = grid
    @marks = [:X, :O]
  end

  def [](pos)
    row, col = pos
    grid[row][col]
  end

  def []=(pos, value)
    row, col = pos
    grid[row][col] = value
  end

  def place_mark(pos, mark)
    raise "This position is taken" unless empty?(pos)
    self[pos] = mark
  end

  def empty?(pos)
    self[pos] == nil
  end

end
