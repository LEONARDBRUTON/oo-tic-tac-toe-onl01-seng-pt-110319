 
 
 
 class TicTacToe

    WIN_COMBINATIONS = [[0,1,2],[3,4,5],[6,7,8],[0,3,6],[1,4,7],[2,5,8],[0,4,8],[6,4,2]]

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

        def input_to_index(input)
            input.to_i-1
        end

        def move(index, player_token = x)
            @board[index] = player_token
        end
        def position_taken?(index)
            !(@board[index].nil? || @board[index] == " ")
        end

        def  valid_move?(index)
            index.between?(0,8)  &&  !position_taken?(index)
        end

        def turn_count
            t_count = 0
            @board.each do |index|
                if index == "X" || index == "O"
                    t_count += 1
                end
            end
            return t_count
        end

        def current_player
           turns = turn_count
            if turns %2 == 0
                 "X"
            else 
                 "O"
            end
        end

        def turn
            puts "Lets Play? Choose a number between 1-9:"
            input = gets.chomp
            index = input_to_index(input)
            if valid_move?(index)
              token = current_player
              move(index, token)
              display_board
            else
              turn
            end
         end

         def won?
            WIN_COMBINATIONS.detect do |win_combo|
                if (@board[win_combo[0]]) == "X" && (@board[win_combo[1]]) == "X" && (@board[win_combo[2]]) == "X"
                  return win_combo
                elsif (@board[win_combo[0]]) == "O" && (@board[win_combo[1]]) == "O" && (@board[win_combo[2]]) == "O"
                  return win_combo
                end
                  false
              end

         end

         def full?
         @board.all?{|occupied| occupied != " "}  
         end

         def draw?
           !(won?) && (full?) 
         end

         def over?
            (won?) || (full?) || (draw?)
         end

         def winner
            index = []
            index = won?
            if !won? || index == false
              return nil
            elsif @board[index[0]] == "X"
                return "X"
            else
                return "O"
              
            end
        end

        def play
            while over? == false
                  turn
            end
            if won?
                  puts "Congratulations #{winner}!"
            elsif draw?
                  puts "Cat's Game!"
            end
        end
        
          
        
    
    
        
end
#TicTacToe.new
#play


