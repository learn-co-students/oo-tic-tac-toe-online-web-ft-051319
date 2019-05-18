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

    # def display_board
    #     counter = 0 
    #     cell = 0 
    #     while cell < @board.length
    #         if counter.odd? 
    #             puts "-" * 11
    #             cell += 1
    #         else
    #             puts " #{@board[cell]} | #{@board[cell + 1]} | #{@board[cell + 2]} "
    #             cell += 2 
    #         end
    #         counter += 1
    #     end
    # end

#option + shift + down 

    def display_board
        puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "
        puts "-----------"
        puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
        puts "-----------"
        puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "
    end

    def input_to_index(user_input)
        return user_input.to_i - 1
    end

    def move(index, token="X")
        @board[index] = token
    end

    def position_taken?(index)
        @board[index] == " " ? false : true 
    end

    def valid_move?(index)
        return @board[index] != nil && position_taken?(index) == false
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
        input = gets.chomp
        index = input_to_index(input)
        player = current_player
        if valid_move?(index) 
            move(index, player)
        else
            #puts "invalid"
            turn
        end
        display_board
    end

    # def turn
    #     puts "Please enter 1-9."
    #     input = gets.chomp
    #     index = input_to_index(input)
    #     player = current_player
    #     if valid_move?(index)
    #       move(index, player)
    #       display_board
    #     else
    #         while valid_move?(index) == false
    #             puts "invalid. Please enter 1-9."
    #             input = gets.chomp
    #             index = input_to_index(input)
    #         end
    #         move(index, current_player)
    #         display_board
    #     end
    # end
end

  