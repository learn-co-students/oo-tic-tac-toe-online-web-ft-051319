require "pry"
class TicTacToe

  WIN_COMBINATIONS = [
    [0,1,2], # First row index
    [3,4,5], # Second row index
    [6,7,8], # Third row index
    [0,3,6], # First column
    [1,4,7], # second column
    [2,5,8],  # third column
    [0,4,8],  # left-right diagonal
    [2,4,6]  # right to left diagonal
  ]

    USED_SPACES = []
   def initialize(board = nil)
     @board = board || Array.new(9, " ")
   end

   def display_board
     puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "
     puts "-----------"
     puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
     puts "-----------"
     puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "
   end

   def input_to_index(string)
     string.to_i - 1
   end

   def move(index, token = "X")
     @board[index] = token
   end

   def position_taken?(index)
     @board[index] == " " ? false : true
   end

   def valid_move?(index)
     @board[index] == " " && (0..8).include?(index) ? true : false
   end

   def turn_count
     @board.count {|position| position != " " }
   end

   def current_player
     turn_count % 2 == 0 ? "X" : "O"
   end

   def turn
     puts "Index please"
     answer = gets.chomp
     index = input_to_index(answer)
      if valid_move?(index)
        move(index, current_player)
        display_board
      else
        answer = gets.chomp
      end
   end

   def won?
     WIN_COMBINATIONS.each do |combo|
       first_token = @board[combo[0]] #unneccesary to do this but easier to read
       second_token = @board[combo[1]]
       third_token = @board[combo[2]]
       if first_token == "X" && second_token == "X" && third_token == "X" || first_token == "O" && second_token == "O" && third_token == "O"
         return combo
       end
     end
     return false # return false here in order to loop through all WIN_COMBINATIONS
    end

   def full?
     @board.include?(" ") ? false : true
   end

   def draw?
     won? == false && full? == true ? true : false
   end

   def over?
     draw? == true || won? != false || full? == true ? true : false
   end

   def winner
     index = won?
     if index == false
       return nil
     elsif @board[index[0]] == "X"
         return "X"
     else @board[index[0]] == "O"
         return "O"
     end
   end

   def play
     until over? == true
       turn
     end
     if won? != false && winner == "X"
       puts "Congratulations X!"
     elsif won? != false && winner == "O"
       puts "Congratulations O!"
     else draw? == true
       puts "Cat's Game!"
     end
   end


end
