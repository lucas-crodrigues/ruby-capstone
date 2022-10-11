class Genre
  attr_accessor :id
  attr_reader :name, :items

  def initialize(name)
    @name = name
    @items = []
    @id = Random.rand(1..1000)
  end

  def add_item(item)
    @items << item
    item.genre - self
  end

  def as_hash
    {
      'name' => @name,
    }
  end
end
