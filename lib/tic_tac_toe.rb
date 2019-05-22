class TicTacToe
  attr_accessor :board
  
WIN_COMBINATIONS = [
  [0, 1, 2],
  [3, 4, 5],
  [6, 7, 8],
  [0, 3, 6],
  [1, 4, 7],
  [2, 5, 8],
  [0, 4, 8],
  [6, 4, 2]
]
  def initialize
    @board = Array.new(9, " ")
  end
  
 def display_board
  puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "
  puts '-----------'
  puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
  puts '-----------'
  puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "
end

  def input_to_index(input)
    input.to_i - 1
  end
  
  def move(index, token)
    @board[index] = token
  end
  
  def position_taken?(index)
    @board[index] != " "
  end
  
  def valid_move?(index)
    index.between?(0,8) && !position_taken?(index)
  end
  
  def turn_count
    board.count{|space| space != " "}
  end
  
  def current_player
    turn_count.even? ? "X" : "O"
  end
  
  def turn
    puts "Please enter 1-9: "
    index = input_to_index(gets.strip)
    if valid_move?(index)
      move(index)
    else
      turn
    end
    
  end
end