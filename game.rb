require_relative './board.rb'
require_relative './cell.rb'
require_relative './player.rb'

#player1 =Player.new('X')
##player2 = Player.new('O')

#players = [player1,player2]

#board = Board.new

#player 1 is first
#player1 = Player.new('X')

class ConnectFour 
    attr_reader :current_player, :board, :player1, :player2, :other_player
    def initialize 
        @board = Board.new
        @player1 = Player.new('X')
        @player2 = Player.new('O')
        @players = [@player1, @player2]
        @current_player, @other_player = @players.shuffle
    end

    def switch_players
        @current_player, @other_player = @other_player, @current_player
    end

    def get_move
        puts "#{current_player.name} : Please insert number of column 1-7"
        player_move = gets.chomp
        if player_move =~ /^[1-7]*$/m  #prevent to crush when input is not a number
               
            return (player_move.to_i) -1

        else
            get_move
        end 
        #return player_move.to_i 
    end

    def play
        puts "#{current_player.name} turn"
        while true
            board.draw_a_grid
            move = get_move
            player_move = board.set_cell(move, current_player.name)
            if player_move == 'game over'
                board.draw_a_grid
                puts "#{current_player.name} wins"
                return
            elsif board.draw_condition? == true
                board.draw_a_grid
                puts 'Its a tie'
            else
                switch_players
            end
        end
        
    end

end

 ConnectFour.new.play
