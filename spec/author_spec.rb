require_relative '../classes/author'

describe 'Unit Tests for Author' do
  before :each do
    @author = Author.new('RR', 'Martin')
  end

  context 'initialize' do
    it 'should be created an Author instance' do
      expect(@author).to be_instance_of Author
    end

    it 'should be an Item' do
      expect(@author).to be_kind_of Item
    end

    it 'should not be an Item' do
      expect(@author).not_to be_instance_of Item
    end
  end

  context 'First name' do
    it 'should be "RR"' do
      expect(@author.first_name).to eql 'RR'
    end
  end

  context 'Last name of author' do
    it 'should be Martin' do
      expect(@author.last_name).to eql 'Martin'
    end
  end
end
