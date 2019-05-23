class TicTacToe



  WIN_COMBINATIONS = [
    [0, 1, 2],
    [3, 4, 5],
    [6, 7, 8],
    [0, 3, 6],
    [1, 4, 7],
    [2, 5, 8],
    [0, 4, 8],
    [2, 4, 6]
  ]


  def initialize(board = nil)
    @board = board || Array.new(9, " ")
  end

  def display_board
    puts " #{@board[0]} | #{@board[1]} | #{@board[2]}  "
    puts "-----------"
    puts " #{@board[3]} | #{@board[4]} | #{@board[5]}  "
    puts "-----------"
    puts " #{@board[6]} | #{@board[7]} | #{@board[8]}  "
  end

  def input_to_index(input)
    input.to_i - 1
  end

  def move(index, player_token = "X")
    @board[index] = player_token
  end


  def position_taken?(index)
  if @board[index] == " " || @board[index] == nil || @board[index] == ""
    return false
  else
    return true
  end
end

  def valid_move?(index)
    index.between?(0,8) && position_taken?(index) == false
  end

  def turn_count
    count = 0
    @board.each do |space|
      if space == "X" || space == "O"
        count += 1
      end
    end
    count
  end

  def current_player
    if turn_count % 2 == 0
      "X"
    else
      "O"
    end
  end

  def turn
    puts "Please enter 1 - 9."
    input = gets.chomp
    index = input_to_index(input)
    if valid_move?(index)
      move(index, current_player)
      display_board
    else
      puts "Please enter 1 - 9."
      input = gets.chomp
      index = input_to_index(input)
    end
  end

  def won?
  WIN_COMBINATIONS.each do |combo|
    win_index_1 = combo[0]
    win_index_2 = combo[1]
    win_index_3 = combo[2]
    position_1 = @board[win_index_1]
    position_2 = @board[win_index_2]
    position_3 = @board[win_index_3]
  if position_1 == "X" && position_2 == "X" && position_3 == "X"
    return combo
  elsif
    position_1 == "O" && position_2 == "O" && position_3 == "O"
    return combo
  else
    false
  end
  end
    return false
end

  def full?
    @board.all?{|space| space == "X" || space == "O"}
  end

 def draw?
   full? && !won?
 end

 def over?
   won? || draw?
 end

 def winner
   if won?
     a_winning_position = won?[0]
     @board[a_winning_position]
  else nil
    end
 end

 def play
   until over?
     turn
   end
    if won?
      puts "Congratulations #{winner}!"
    else
      puts "Cat's Game!"
    end
  end

 end
