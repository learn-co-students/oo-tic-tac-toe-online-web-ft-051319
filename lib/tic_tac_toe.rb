class TicTacToe
    attr_accessor :board

    WIN_COMBINATIONS = [
        [0,1,2], 
        [3,4,5],
        [6,7,8],
        [0,3,6],
        [1,4,7],
        [2,5,8],
        [0,4,8],
        [6,4,2]
    ]

    def initialize(board = nil)
        @board = board || Array.new(9, " ")
    end

    def display_board
        puts "   |   |   "
        puts "-----------"
        puts "   |   |   "
        puts "-----------"
        puts "   |   |   "

       puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "
       puts "___________"
       puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
       puts "___________"
       puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "
    end

    def input_to_index(input)
        input.to_i - 1
    end

    def move(index, player = "X")
        @board[index] = player
    end

    def position_taken?(i)  
      if @board[i] == "X" || @board[i] == "O"
         true
        else 
        false
        end
        
    end

    def valid_move?(index)
        if index.between?(0,8) && !position_taken?(index)
           return true
        end
    end

    def turn_count
        counter = 0
        @board.each do |i|
            if i == "X" || i == "O"
                counter += 1
            end
        end
        counter 
        
    end

    def current_player
        turn_count % 2 == 0 ? "X" : "O"
    end

    def turn
        # ask for input (pos between 1-9)
        # recieve the user's input
        # translate that input into an index value
        # if the move is valid, make the move and display the board
        # if the move is invalid, ask for a new move until a valid move is recieved
        puts "Please enter 1-9:"
        input = gets.chomp
        index = input_to_index(input)
        if valid_move?(index)
            move(index, current_player)  
        else
            turn
        end
        display_board
    end

    def won?
        
    end

    def full?
        @board.all?{|i| i == "X" || i == "O"}
    end

    def draw?
        if full? && !won?
            true
        elsif !full? && !won?
            false
        else won?
            false
        end
    end

    def over?
        if won? || draw? || full?
            true
        end
    end

    def winner
        if won?
            board[won?[0]]
        end
    end

end