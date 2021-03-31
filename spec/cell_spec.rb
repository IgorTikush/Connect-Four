require './cell.rb' 
RSpec.describe Cell do
    describe 'initialize' do
        it 'has empty value' do
            cell = Cell.new
            expect(cell.value).to be_empty
        end
    end

end