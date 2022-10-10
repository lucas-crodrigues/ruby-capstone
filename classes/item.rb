require 'date'

class Item
  attr_accessor :publish_date, :archived
  attr_reader :id, :genre, :author, :source, :label

  def initialize(publish_date)
    @id = rand(1..1000)
    @publish_date = publish_date
    @archived = false
  end

  def genre=(genre)
    @genre = genre
    genre.items << self unless genre.items.includes(self)
  end

  def author=(author)
    author.is_a?(Author) && @author.nil? && (
      @author = author
      author.add_item(self)
    )
  end

  def source=(source)
    @source = source
    source.items << self unless source.items.includes(self)
  end

  def label=(label)
    @label = label
    label.items << self unless label.items.includes(self)
  end

  def move_to_archive
    @archived = can_be_archived?
  end

  private

  def can_be_archived?
    Date.today - Date.parse(@publish_date) > 10 * 365
  end
end
