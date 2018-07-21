class Board
  attr_reader :grid, :marks

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
    marks.each do |mark|
      rows.each { |row| return mark if row.count(mark) == row.length }
      columns.each { |col| return mark if col.count(mark) == col.length }
      diagonals.each { |diag| return mark if diag.count(mark) == diag.length }
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
