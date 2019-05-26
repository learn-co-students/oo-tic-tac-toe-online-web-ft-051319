require 'pry'

class TicTacToe
  
  WIN_COMBINATIONS = [[0,1,2], [3,4,5], [6,7,8], [0,3,6], [1,4,7], [2,5,8], [0,4,8], [2,4,6]]

  def initialize()
    @board = Array.new(9, " ")
  end
  
  def display_board
  
    
      puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "
      puts "-----------"
      puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
      puts "-----------"
      puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "
   end
   
def input_to_index(user_input)
  user_input.to_i - 1
end

def move(index, token = "X")
  input = input_to_index(index + 1)
  @board[input] = token
end

def position_taken?(position)
  if(@board[position] == "X" || @board[position] == "O")
    return true
  else
    return false
  end
end

def valid_move?(position)
  if(position >= 0 && position <= 8 && @board[position] == " ") 
    return true
  else
    return false
  end

end

def turn_count
  @board.count{|token| token == "X" || token == "O"}
end

def current_player
  turn_count % 2 == 0 ? "X" : "O"
end

def turn
  input = gets.chomp
  index = input_to_index(input)
  valid = valid_move?(index)
  
  if valid == true
    @board[index] = current_player
    display_board
  else
    puts "Please enter a new move"
    input = gets.chomp
    valid_move?(input_to_index(input))
  end
end

def won?
  temp = []
    #binding.pry
    WIN_COMBINATIONS.each_with_index do |combo_arr, combo_index|
      combo_arr.each do |position_index|
         
      temp << @board[position_index]
      end
    if temp.all? {|token| token == "X" } || temp.all? {|token| token == "O" }
      return combo_arr
    else
      temp = []
     #binding.pry
    end
  end
    return false
end

def full?
  @board.all? {|token| token == "X" || token == "O"}
end

def draw?
  if full? && !won?
    return true
  else
    return false
   end
end

def over?
  if won? || full?
    return true
  end
end

def winner
    #binding.pry
    if won?
      if @board[won?[0]] == "X"
        return "X"
      elsif  @board[won?[0]] == "O"
        return "O"
      end
    else
      return nil
    end
  end
def play
  user = gets.chomp
  3.times do
    turn
    over?
  end
  
end
end