class HumanPlayer
  attr_reader :name
  attr_accessor :mark

  def initialize(name)
    @name = name
  end

  def get_move
    begin
      puts "Where would you like to move (row, col)?"
      print '> '
      position = gets.chomp
      position.split(", ").map { |el| Integer(el) }
    rescue ArgumentError
      puts "Error: please enter valid numbers in format row, col"
      retry
    end
  end

  def receive_board(board)
    #duck typing
  end
end
