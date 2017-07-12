require_relative 'plateau'
require_relative 'rover'

RSpec.describe 'Mars rover' do
  let(:plateau){ Plateau.new([5,5]) }

  context 'Plateau' do

    it 'should respond to square' do
      expect(plateau).to have_attributes(square: [5, 5])
    end

    it 'should have pole directions' do
      expect(plateau.directions).to eq(%w(N E S W))
    end
  end

  context 'Rover' do
    let(:rover1){ Rover.new('1 2 N', 'LMLMLMLMM', plateau) }
    let(:rover2){ Rover.new('3 3 E', 'MMRMMRMRRM', plateau) }

    it 'should respond to position' do
      expect(rover1).to have_attributes(position: '1 2 N')
    end

    it 'should pass instructions validation' do
      expect(rover1.validate_instructions).to be true
    end

    it 'shouldn\'t pass instructions validation' do
      expect(Rover.new('1 2 N', 'LMLMLMLHHHMM', plateau).validate_instructions).to be false
    end

    it 'should pass position validation' do
      expect(rover1.validate_position(1, 2)).to be true
    end

    it 'shouldn\'t pass position validations' do
      expect(rover1.validate_position(10, 2)).to be false
    end

    it 'should return valid result' do
      rover1.move
      expect(rover1.position).to eq('1 3 N')
      rover2.move
      expect(rover2.position).to eq('5 1 E')
    end
  end

end
