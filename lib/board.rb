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
    raise "Error: this position is taken" unless empty?(pos)
    raise "Error: this position is outside of the board" unless valid_index?(pos)
    self[pos] = mark
  end

  def empty?(pos)
    self[pos] == nil
  end

  def valid_index?(pos)
    pos.all? { |idx| idx.between?(0, 3) }
  end

  def rows
    grid
  end

  def columns
    rows.transpose
  end

  def diagonals
    left_diag = []
    right_diag = []
    diags = []
    rows.each_with_index do |row, index|
      left_diag << row[index]
      right_diag << row[-index + (row.length - 1)]
    end
    diags << left_diag << right_diag
  end

  def winner
    rows.each do |row|
      return :X if row.count(:X) == row.length
      return :O if row.count(:O) == row.length
    end
    columns.each do |col|
      return :O if col.count(:O) == col.length
      return :X if col.count(:X) == col.length
    end
    diagonals.each do |diag|
      return :O if diag.count(:O) == diag.length
      return :X if diag.count(:X) == diag.length
    end

    nil
  end

  def render
    row0 = "0 |"
    (0..2).each do |col|
      row0 << (self[[0, col]] == nil ? "   |" : " " + self[[0, col]].to_s + " |")
    end
    row1 = "1 |"
    (0..2).each do |col|
      row1 << (self[[1, col]] == nil ? "   |" : " " + self[[1, col]].to_s + " |")
    end
    row2 = "2 |"
    (0..2).each do |col|
      row2 << (self[[2, col]] == nil ? "   |" : " " + self[[2, col]].to_s + " |")
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
