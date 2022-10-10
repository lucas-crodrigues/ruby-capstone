require 'date'
require_relative './item'

class Author < Item
  attr_accessor :first_name, :last_name
  attr_reader :id, :items

  def initialize(first_name, last_name)
    super(id = Random.rand(1..1000))
    @id = id
    @first_name = first_name
    @last_name = last_name
    @items = []
  end

  def add_item(item)
    # add item to items array
    item.add_author(self)
  end
end
