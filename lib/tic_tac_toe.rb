require "pry"

class TicTacToe

  def initialize
    @board=Array.new(9," ")
  end

  WIN_COMBINATIONS= [
    [0,1,2],
    [3,4,5],
    [6,7,8],
    [0,3,6],
    [1,4,7],
    [2,5,8],
    [0,4,8],
    [2,4,6]
  ]

  def display_board
    puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "
    puts "-----------"
    puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
    puts "-----------"
    puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "
  end

  def input_to_index(input)
    board_index=input.to_i-1
    board_index
  end

  def move(index,token="X")
    @board[index]=token
  end

  def position_taken?(index)
    @board[index]==" "? false : true
  end

  def valid_move?(index)
    if @board[index]== " " && (0..8).to_a.include?(index)
      true
    else
      false
    end
  end

  def turn_count
    @board.count{|i| i=="X" || i=="O"}
  end

  def current_player
    turn_count % 2 == 0? "X" : "O"
  end

  def turn
    input=gets.chomp
    index=input_to_index(input)
    if valid_move?(index)
      token = current_player
      move(index,token)
      display_board
    else
      input=gets.chomp
    end
  end

  def won?
    @x=[]
    @o=[]
    @board.each_with_index do |a,i|
      if a=="X"
        @x << i #creating array of X indices
      elsif a =="O"
        @o << i #creating array for O indices
      end
    end
    resultx=WIN_COMBINATIONS.map{|i| (i-@x).empty?}
    #this creates an array of true or false to see if all elements in each winning array in our WIN_COMBINATIONS
    #constant is present in our X indices
    #https://stackoverflow.com/questions/7387937/how-to-determine-if-one-array-contains-all-elements-of-another-array
    resulto=WIN_COMBINATIONS.map{|i| (i-@o).empty?}
    #doing the same for the O's
    @winning_combi=[]
    if resultx.any?
      @winning_combi=WIN_COMBINATIONS[resultx.index(true)]
      @winning_combi
    elsif resulto.any?
      @winning_combi=WIN_COMBINATIONS[resulto.index(true)]
      @winning_combi
    else
      false
    end
  end

  def full?
    @board.any?(" ")? false : true
  end

  def draw?
    if won? || (full?) == false
      false
    elsif self.won? ==false && (full?)==true
      true
    else
      true
    end
  end

  def over?
    if draw? || won?
      true
    else
      false
    end
  end

  def winner
    if draw?
      nil
    elsif won?
      ((@winning_combi-@x).empty?)? "X" : "O"
      #if x contains all the winning_combi indices then X is the winner, otherwise it's O
    else
      nil
    end
  end

  def play
    while (over?) == false
      turn
    end

    if won?
      puts "Congratulations #{winner}!"
    else
      puts "Cat's Game!"
    end
  end

end
