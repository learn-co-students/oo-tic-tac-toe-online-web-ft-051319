class TicTacToe
  attr_accessor :board
  
  WIN_COMBINATIONS = [
    [0,1,2], [3,4,5], [6,7,8],
    [0,3,6], [1,4,7], [2,5,8],
    [0,4,8], [6,4,2]
    ]
  
  def initialize
    @board = board || Array.new(9, " ")
  end
  
  def display_board
    puts " #{board[0]} | #{board[1]} | #{board[2]} "
    puts "-----------"
    puts " #{board[3]} | #{board[4]} | #{board[5]} "
    puts "-----------"
    puts " #{board[6]} | #{board[7]} | #{board[8]} "
  end
  
  def input_to_index(users_input)
    users_input.to_i - 1
  end
  
  def move(index, player)
    board[index] = player
  end
  
  def position_taken?(index)
    if (board[index] == " " || board[index] == "" || board[index] == nil)
      return false
    else return true
    end
  end
  
  def valid_move?(index)
    if index.between?(0,8) && !position_taken?(index) == true
      return true
    else false
    end
  end
  
  def turn_count
    count = 0
    board.each do |space|
      if space == "X" || space == "O"
        count += 1
      end
    end
    count
  end
  
  def current_player
    turn_count % 2 == 0 ? "X" : "O"
  end
  
  def turn
    users_input = gets.strip
    index = input_to_index(users_input)
    if valid_move?(index) == true
      move(index, current_player)
      display_board
    else users_input = gets.strip
    end
  end
  
  def won?
    WIN_COMBINATIONS.find do |win_combo|
      win_index_1 = win_combo[0]
      win_index_2 = win_combo[1]
      win_index_3 = win_combo[2]
      
      space_1 = board[win_index_1]
      space_2 = board[win_index_2]
      space_3 = board[win_index_3]
      
      space_1 == space_2 && space_2 == space_3 && position_taken?(win_index_1)
    end
  end
  
  def full?
    board.all? { |space| space == "X" || space == "O" }
  end
  
  def draw?
   if won? == nil && full? == true
     return true
   end
  end
  
  def over?
    if draw? || won? || full?
      return true
    end
  end
  
  def winner
    if won?
      return board[won?.to_a[0]]
    end
  end
  
  def play
    until over? == true
      turn
    end
    if won?
      puts "Congratulations #{winner}!"
    elsif draw?
      puts "Cat's Game!"
    end
  end
  
end
