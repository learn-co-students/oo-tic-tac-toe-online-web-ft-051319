
class TicTacToe
 
  
  WIN_COMBINATIONS = [
    [0,1,2], 
    [3,4,5],  
    [6,7,8],  
    [0,3,6],  
    [1,4,7],  
    [2,5,8],  
    [0,4,8],  
    [2,4,6]]
  
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
   
   def input_to_index(user_input) 
     user_input.to_i - 1 
   end
   
   def move(position, token)
     @board[position] = token
   end
   
   def position_taken?(index_value)
      @board[index_value] == "X" || @board[index_value] == "O"
    end
    
    def valid_move?(index_value)
     index_value >= 0 && index_value <= 8 && !position_taken?(index_value)
   end
   
   def turn_count
     turns = 0 
     @board.each do |position| 
       if position == "X" || position == "O" 
         turns += 1 
       end 
     end 
     turns
   end
   
   def current_player 
    if turn_count.odd? 
      "O"
    else 
      "X"
    end
  end
  
def turn
    puts "Please enter a number 1-9:"
    user_input = gets.strip
    index = input_to_index(user_input)
    until valid_move?(index)
    puts "Please enter a number 1-9:"
    user_input = gets.strip
    index = input_to_index(user_input)
    end 
      move(index, current_player)
      display_board
    end

 
 def won?
   WIN_COMBINATIONS.detect do |winner| 
     if @board[winner[0]] == "X" && @board[winner[1]] == "X" && @board[winner[2]] == "X"
       winner 
     elsif
        @board[winner[0]] == "O" && @board[winner[1]] == "O" && @board[winner[2]] == "O"
       winner 
     else 
     false
   end
   end 
 end 
 
 def full? 
   if @board.any? {|s| s == " "}
     false
   else 
     true 
   end  
 end
 
 def draw? 
      if @board.any? {|s| s == " "} || won?
     false
   else 
     true 
   end  
 end
 
 def over?
   if won? || draw? 
     true 
   else 
     false
   end 
 end 
 
 def winner 
     
    if won? 
      @board[won?[0]] == "X" ? "X" : "O"
   else
     nil
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