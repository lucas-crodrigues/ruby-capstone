require_relative '../classes/game'

describe 'Unit Tests for Game' do
  before :each do
    @game = Game.new('1997/09/24', '2007/04/22', 'Yes')
  end

  context 'initialize object' do
    it 'should be an Game instance' do
      expect(@game).to be_instance_of Game
    end

    it 'should not be an Item instance' do
      expect(@game).not_to be_instance_of Item
    end

    it 'should be an Item' do
      expect(@game).to be_kind_of Item
    end
  end

  context 'when was game last played' do
    it 'should be "2007/04/22"' do
      expect(@game.last_played).to eql '2007/04/22'
    end

    context 'when was game published' do
      it 'should be "1997/09/24"' do
        expect(@game.publish_date).to eql '1997/09/24'
      end
    end
    context 'Multiplayer Game' do
      it 'should be "Yes"' do
        expect(@game.multiplayer).to eql 'Yes'
      end
    end
  end
end
