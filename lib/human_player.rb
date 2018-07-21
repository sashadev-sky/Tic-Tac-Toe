class HumanPlayer
  attr_accessor :name, :mark

  def initialize(name)
    @name = name
    @mark = :X
  end

  def get_move
    begin
      puts "Where would you like to move? Please give coordinates in format number, number"
      print '> '
      position = gets.chomp
      position.split(", ").map { |el| Integer(el) }
    rescue ArgumentError
      puts "Error: please enter valid numbers"
      retry
    end
  end

  def receive_board(board)
    #duck typing
  end
end
