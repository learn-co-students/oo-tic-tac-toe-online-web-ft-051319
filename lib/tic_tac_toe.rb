require "pry"

class TicTacToe
  
  def initialize
    @board = Array.new(9, " ")
  end
  
  WIN_COMBINATIONS = [
    [0,1,2],
    [3,4,5],
    [6,7,8],
    [0,3,6],
    [1,4,7],
    [2,5,8],
    [0,4,8],
    [6,4,2]]
  
  
  
   def display_board
    puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "
    puts "-----------"
    puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
    puts "-----------"
    puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "
  end
  
  def input_to_index(input)
    input.to_i-1
  end
  
  def move (index, current_player)
    @board[index] = current_player
    display_board
  end
  
  def current_player
    turn_count % 2 == 0 ? "X" : "O"
  end
  
  def turn_count
    @board.count{|token| token == "X" || token == "O"}
  end
  
  def position_taken?(index)
    (@board[index] == " ")? false: true
  end
  
  def valid_move?(index)
    if index <= 8 && index >= 0 && (index.is_a? Integer) && @board[index] == " "
      true
    else
      false
    end
  end
  
  def turn 
    puts "For your move, please specify a position between 1-9."
    input = gets.chomp
    index = input_to_index(input)
    if valid_move?(index)== true
      move(index, current_player)
    else
      turn
    end
    
  end
  
  def won?
    return_arr = []
    player_x_arr = []
    player_o_arr = []
    @board.each_with_index do |player, index|
      if player == "X"
        player_x_arr << index
      elsif player == "O"
        player_o_arr << index
      end
    end
    WIN_COMBINATIONS.each do |win_arr|
      if win_arr.all?{|num| player_o_arr.include?(num) == true}
        win_arr.each{|num| return_arr << num }
      elsif win_arr.all?{|num| player_x_arr.include?(num) == true}
        win_arr.each{|num| return_arr << num }
      else
        return_arr << nil
      end
    end
     if return_arr.all?{|num| num == nil}
       nil
     else
       return_arr.compact
     end
  end
  
  def full?
    (@board.include?(" "))? false : true
  end
  
  def draw?
    if full? == true && won? == nil
      true
    else
      false
    end
  end
  
  def over?
    won?!= nil || draw? == true
  end
  
  def winner
    player_x_arr = []
    player_o_arr = []
    @board.each_with_index do |player, index|
      if player == "X"
        player_x_arr << index
      elsif player == "O"
        player_o_arr << index
      end
    end
    if won? == nil
      nil
    elsif won?.all?{|num| player_o_arr.include?(num) == true}
      "O"
    else won?.all?{|num| player_x_arr.include?(num) == true}
      "X"
    end
  end
  
  def play
    until over? == true
      turn
    end
    won?
    draw?
    if won? != nil
      puts "Congratulations #{winner}!"
    else draw? == true
      puts "Cat's Game!"
    end
    
  end
end