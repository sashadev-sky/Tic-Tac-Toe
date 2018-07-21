class HumanPlayer
  attr_accessor :name, :mark

  def initialize(name)
    @name = name
    @mark = :X
  end

  def get_move
    puts "where would you like to move? please give coordinates in format number, number"
    begin
      position = gets.chomp
      position.split(", ").map { |el| Integer(el) }
    rescue
      puts "Error: please enter valid numbers" 
      retry
    end
  end

  def receive_board(board)
    #duck typing
  end
end
