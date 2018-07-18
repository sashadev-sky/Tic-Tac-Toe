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

  def render
    row0 = "0 |"
    (0..2).each do |col|
      row0 << (grid[0][col] == nil ? "   |" : " " + grid[0][col].to_s + " |")
    end
    row1 = "1 |"
    (0..2).each do |col|
      row1 << (grid[1][col] == nil ? "   |" : " " + grid[1][col].to_s + " |")
    end
    row2 = "2 |"
    (0..2).each do |col|
      row2 << (grid[2][col] == nil ? "   |" : " " + grid[2][col].to_s + " |")
    end

    puts "    0   1   2  "
    puts "  |-----------|"
    puts row0
    puts "  |-----------|"
    puts row1
    puts "  |-----------|"
    puts row2
    puts "  |-----------|"
  end

end
