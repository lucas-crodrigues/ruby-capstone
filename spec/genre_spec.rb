require_relative '../classes/genre'
require_relative '../classes/item'

describe Genre do
  test_genre1 = Genre.new('test1')
  item1 = Item.new('20/05/2008')
  it 'test_genre1 should return "test1" as its name' do
    expect(test_genre1.name).to eq('test1')
  end

  it 'After adding one item "item1" to test_genre1 its items array should include "item1"' do
    test_genre1.add_item(item1)

    expect(test_genre1.items.include?(item1)).to be true
  end
end
