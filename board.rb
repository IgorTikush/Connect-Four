require_relative './cell.rb'

class Board
    attr_reader :grid
    
    def initialize
        @grid = Array.new(7){Array.new(7){Cell.new}}
    end

    def draw_a_grid
        grid.each do |row|
            puts row.map { |cell| cell.value.empty? ? "|_|" : "|#{cell.value}|" }.join("")
        end
    end

    def set_cell(column,value)
        index = 6
        grid.reverse_each do |row|
            
            if row[column].value.empty? 
                row[column].value = value
                #check for win condition
#=begin
                if horizontal_win_condition(index) || vertical_win_condition(column) || diagonal_win_condition
                    return 'game over'
                end
#=end           
                
               return
            end
           
            index= index -1
        end   
    end

    #def check_for_win_conditon(cell)

    #end


    def horizontal_win_condition(row)   
        0.upto 3 do |i|
          
            if grid[row][i].value == grid[row][i+1].value && grid[row][i].value == grid[row][i+2].value && grid[row][i].value == grid[row][i+3].value 
                return true unless grid[row][i].value == ''
            end
        end
    #puts 'some text'
    return false
    end

    def vertical_win_condition(column)
        0.upto 3 do |i|
            if grid[i][column].value == grid[i+1][column].value && grid[i][column].value == grid[i+2][column].value && grid[i][column].value == grid[i+3][column].value 
                return true unless grid[i][column].value == ''
            end
        end
        return false
    end

    def diagonal_win_condition
        3.upto 6 do |row|
            0.upto 3 do |column| 
                if grid[row][column].value == grid[row-1][column+1].value && grid[row][column].value == grid[row-2][column+2].value && grid[row][column].value == grid[row-3][column+3].value
                    return true unless grid[row][column].value == ''
                end
            end
            
        end

        0.upto 3 do |row|
            1.upto 3 do |column|
                if grid[row][column].value == grid[row-1][column+1].value && grid[row][column].value == grid[row-2][column+2].value && grid[row][column].value == grid[row-3][column+3].value
                    return true unless grid[row][column].value == ''
                end
            end
        end

        3.upto 6 do |row|
            6.downto 3 do |column| 
                if grid[row][column].value == grid[row-1][column-1].value && grid[row][column].value == grid[row-2][column-2].value && grid[row][column].value == grid[row-3][column-3].value
                    return true unless grid[row][column].value == ''
                end
            end
            
        end

        4.upto 6 do |row|
            3.upto 5 do |column|
                if grid[row][column].value == grid[row-1][column-1].value && grid[row][column].value == grid[row-2][column-2].value && grid[row][column].value == grid[row-3][column-3].value
                    return true unless grid[row][column].value == ''
                end
            end
        end
        return false
    end

    def draw_condition?
        grid.each do |row| 
            row.each do |i|
                if i.value == ''
                    return false
                else 
                    return true
                end
            end
        end
        
        false
    end

    
            


    
end
            
board = Board.new

#board.draw_condition#

#board.draw_a_grid
