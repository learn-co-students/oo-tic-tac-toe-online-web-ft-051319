
class TicTacToe
    attr_accessor :board 

    WIN_COMBINATIONS = [
        [0,1,2], [3,4,5], [6,7,8],
        [0,3,6], [1,4,7], [2,5,8],
        [0,4,8], [6,4,2]
    ]

    def initialize
        @board = Array.new(9, " ")
    end

    def display_board
        counter = 0 
        cell = 0 
        while cell < @board.length
            if counter.odd? 
                puts "-" * 11
                cell += 1
            else
                puts " #{@board[cell]} | #{@board[cell + 1]} | #{@board[cell + 2]} "
                cell += 2 
            end
            counter += 1
        end
    end


    # def display_board
    #     puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "
    #     puts "-----------"
    #     puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
    #     puts "-----------"
    #     puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "
    # end

    def input_to_index(user_input)
        return user_input.to_i - 1
    end

    def move(index, token="X")
        @board[index] = token
    end

    def position_taken?(index)
        @board[index] != " " 
    end

    def valid_move?(index)
        index.between?(0,8) && !position_taken?(index)
    end

    def turn_count
        counter = 0 
        index = 0
        while index < @board.length
            if position_taken?(index)
                counter +=1 
            end
            index += 1
        end
        counter
    end

    def current_player
        turn_count.odd? ? "O" : "X"
    end

    def turn
        puts "Please enter 1-9."
        input = gets.strip
        index = input_to_index(input)
        player = current_player
        if valid_move?(index) 
            move(index, player)
        else
            turn
        end
        display_board
    end

    def won?
        empty_board = @board.none? { |i| i == "X" || i = "O"}
        if empty_board
            false
        else 
            WIN_COMBINATIONS.each do |combination| 
            if @board[combination[0]] == "X" && @board[combination[1]] == "X" && @board[combination[2]] == "X" || @board[combination[0]] == "O" && @board[combination[1]] == "O" && @board[combination[2]] == "O"
                return combination
            end
            end
            return false
        end
    end

    def full?
        @board.all? { |i| i =="X" || i == "O"}
    end

    def draw?
        !won? && full? ? true : false
    end
    
    def over?
        won? || draw? || full? ? true : false
    end

    def winner 
        WIN_COMBINATIONS.each do |combination| 
              if @board[combination[0]] == "X" && @board[combination[1]] == "X" && @board[combination[2]] == "X" 
                return "X"
              elsif @board[combination[0]] == "O" && @board[combination[1]] == "O" && @board[combination[2]] == "O"
                return "O"
              end
        end
        return nil 
    end

    def play
        until over?
          turn
        end
        won? ? (puts "Congratulations #{winner}!") : (puts "Tie game")
    end
end

  