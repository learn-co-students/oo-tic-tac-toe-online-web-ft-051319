class TicTacToe
  WIN_COMBINATIONS = [
    [0,1,2], #top row
    [3,4,5], #mid row
    [6,7,8], #bot row
    [0,4,8], #L - R Diag top bot
    [2,4,6], #R-L Diag top bot
    [0,3,6], #L down
    [2,5,8], #R down
    [1,4,7] #mid down
  ]

  def initialize
    @board = Array.new(9, " ")
  end

  def display_board
    puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "
    puts "-----------"
    puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
    puts "-----------"
    puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "
  end

  def input_to_index(input)
    input.to_i - 1
  end

  def move(space, token = "X")
    @board[space] = token
  end

  def position_taken?(position)
    @board[position] != " "
  end

  def valid_move?(index)
    index.between?(0,8) && !position_taken?(index)
  end

  def turn_count
    @board.count{|token| token == "X" || token == "O"}
  end

  def current_player
    turn_count % 2 == 0 ? "X" : "O"
  end

  def turn
   puts "Please enter 1-9:"
    input = gets.strip
    index = input_to_index(input)
     if valid_move?(index)
       move(index, current_player)
       display_board
     else turn
    end
   end

  def won?
    WIN_COMBINATIONS.each do |win_combination|
      if @board[win_combination[0]] == "X" && @board[win_combination[1]] == "X" && @board[win_combination[2]] == "X"
        return win_combination
      elsif
        @board[win_combination[0]] == "O" && @board[win_combination[1]] == "O" && @board[win_combination[2]] == "O"
        return win_combination
      else
        false
      end
    end
    false
  end

  def full?
    @board.none?{|space| space == " "}
  end

  def draw?
    !won? && full?
    if !won? && full?
      return true
    elsif !won? && !full?
      return false
    elsif won?
      return false
    end
  end

  def over?
    won? || draw?
  end

  def winner
   win_combination = won?
   if win_combination
      winning_location = win_combination[0]
      @board[winning_location]
    else
      nil
    end
  end

  def play
    until over?
      turn
    end

    if won?
      puts "Congratulations #{winner}!"
    elsif draw?
      puts "Cat's Game!"
    end
  end
end
