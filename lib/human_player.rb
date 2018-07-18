class HumanPlayer
  attr_accessor :name, :mark

  def initialize(name)
    @name = name
    @mark = :X
  end

  def get_move
    puts "where would you like to move? please give coordinates in format number, number"
    position = gets.chomp
    position.split(", ").map { |el| el.to_i }
  end

  def display(board)
    row0 = "0 |"
    (0..2).each do |col|
      row0 << (board[0][col] == nil ? "   |" : " " + board[0][col].to_s + " |")
    end
    row1 = "1 |"
    (0..2).each do |col|
      row1 << (board[1][col] == nil ? "   |" : " " + board[1][col].to_s + " |")
    end
    row2 = "2 |"
    (0..2).each do |col|
      row2 << (board[2][col] == nil ? "   |" : " " + board[2][col].to_s + " |")
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
