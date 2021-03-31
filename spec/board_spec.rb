require './board.rb' 

RSpec.describe Board do
    describe '#initialize' do
        it 'has 7x7 board' do
            board = Board.new
            expect(board.grid.length).to eq(7)
            expect(board.grid[0].length).to eq(7)
        end
    end

    #    describe 'draw a gridw' do
    #       it 'returns drawn grid ' do
    #            board = Board.new
    #            board.draw_a_grid
    #            expect(board.draw_a_grid).to eq('|_||_||_||_||_||_||_|\n
    #                |_||_||_||_||_||_||_|
    #                |_||_||_||_||_||_||_|
    #                |_||_||_||_||_||_||_|
    #                |_||_||_||_||_||_||_|
    #                |_||_||_||_||_||_||_|
     #               |_||_||_||_||_||_||_|')
    #        end
    #    end

    describe 'set_cell' do
        board = Board.new
        it 'sets certain cell to certain ' do
            
            #allow(board).to receive(set_cell(2,'X')).and_return('x')
            board.set_cell(3, 'X')
            expect(board.grid[6][3].value).to eq('X')
        end
=begin
        it 'returns game over if winning condtion' do
            board.set_cell(0, 'X')
            board.set_cell(1, 'X')
            board.set_cell(2, 'X')
           

            expect(board.set_cell(3, 'X')).to eq('game over')
        end
=end
       

            
    end

    describe 'horizontal win condition' do
        

        it 'returns false if board is empty' do
            board = Board.new
            expect(board.horizontal_win_condition(6)).to eq(false)
        end

        it 'returns true if 4 in horizontal in start of the row' do
            board = Board.new
            board.set_cell(0, 'X')
            board.set_cell(1, 'X')
            board.set_cell(2, 'X')
            board.set_cell(3, 'X')

            expect(board.horizontal_win_condition(6)).to be_truthy
        end

        it 'returns true if 4 horizontal in end of the row' do
            board = Board.new
            board.set_cell(3, 'X')
            board.set_cell(4, 'X')
            board.set_cell(5, 'X')
            board.set_cell(6, 'X')
            expect(board.horizontal_win_condition(6)).to be_truthy
        end

        it 'returns true if 4 horizontal in the middle of the row' do
            board = Board.new
            board.set_cell(2, 'X')
            board.set_cell(3, 'X')
            board.set_cell(4, 'X')
            board.set_cell(5, 'X')
            expect(board.horizontal_win_condition(6)).to be_truthy
        end

        it 'returns true for second row' do
            board = Board.new
            board.set_cell(1, '1')
            board.set_cell(2, '2')
            board.set_cell(3, '3')
            board.set_cell(4, '4')
            board.set_cell(1, 'x')
            board.set_cell(2, 'x')
            board.set_cell(3, 'x')
            board.set_cell(4, 'x')
            expect(board.horizontal_win_condition(5)).to be_truthy
        end

    end

    describe 'vertical win condition' do
        
        it 'returns true if 4 in verical in start of the row' do
            board = Board.new
            board.set_cell(2, 'X')
            board.set_cell(2, 'X')
            board.set_cell(2, 'X')
            board.set_cell(2, 'X')

            expect(board.vertical_win_condition(2)).to be_truthy
        end

        it 'returns true if 4 verical in end of the row' do
            board = Board.new
            board.set_cell(2, 'O')
            board.set_cell(2, 'O')
            board.set_cell(2, '2')
            board.set_cell(2, 'X')
            board.set_cell(2, 'X')
            board.set_cell(2, 'X')
            board.set_cell(2, 'X')
            expect(board.vertical_win_condition(2)).to eq(true)
        end

        it 'returns true if 4 verical in the middle of the row' do
            board = Board.new
            board.set_cell(2, 'O')
            board.set_cell(2, 'X')
            board.set_cell(2, 'X')
            board.set_cell(2, 'X')
            board.set_cell(2, 'X')
            expect(board.vertical_win_condition(2)).to be_truthy
        end

        it 'returns false on an empty board' do
            board = Board.new
            expect(board.vertical_win_condition(2)).to be_falsy
        end
    end

    describe 'diagonal win condition' do 
        it ' returns true for left diagonal' do
            board = Board.new
            board.set_cell(1, 'X')
            board.set_cell(2, 'O')
            board.set_cell(2, 'X')
            board.set_cell(3, 'O')
            board.set_cell(3, 'O')
            board.set_cell(3, 'X')
            board.set_cell(4, 'O')
            board.set_cell(4, 'O')
            board.set_cell(4, 'O')
            board.set_cell(4, 'X')

            expect(board.diagonal_win_condition).to be_truthy
        end

        it ' returns true for left diagonal' do
            board = Board.new
            board.set_cell(1, 'O')
            board.set_cell(1, 'O')
            board.set_cell(1, 'O')
            board.set_cell(1, 'X')
            board.set_cell(2, 'O')
            board.set_cell(2, 'O')
            board.set_cell(2, 'X')
            board.set_cell(3, 'O')
            board.set_cell(3, 'X')
            board.set_cell(4, 'X')
            
            expect(board.diagonal_win_condition).to be_truthy
        end

        it 'returns false for empty board' do
            board = Board.new
            expect(board.diagonal_win_condition).to be_falsy
        end
    end

    describe 'draw contition' do

        it 'return true if all cells are set' do
            board = Board.new
            board.grid.each do |row|
                row.map { |cell| cell.value = rand(1...20)}
            end

            expect(board.draw_condition?).to eq(true)
        end

        it 'returns false if all cell are empty' do
            board = Board.new
            board.set_cell(1, 'O')
            expect(board.draw_condition?).to eq(false)
        end
    end

end