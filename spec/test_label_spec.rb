require_relative '../classes/label'
require_relative '../classes/item'

describe Label do
  test_label1 = Label.new('test1', 'Yellow')
  item1 = Item.new('20/05/2008')
  it 'test_label1 should return "test1" as its title and "yellow as its color object should return' do
    expect(test_label1.title).to eq('test1')
    expect(test_label1.color).to eq('Yellow')
  end

  it 'After adding one item "item1" to test_label1 its items array should include "item1"' do
    test_label1.add_item(item1)

    expect(test_label1.items.include?(item1)).to be true
  end
end
