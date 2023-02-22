require_relative './item'

class Book < Item
  attr_accessor :publisher, :cover_state

  def initialize(publish_date, publisher, cover_state)
    super(publish_date)
    @publisher = publisher
    @cover_state = cover_state
  end

  def as_hash
    {
      'id' => @id,
      'genre' => @genre.nil? ? '' : @genre,
      'author' => @author.nil? ? '' : @author,
      'source' => @source.nil? ? '' : @source,
      'label' => @label.nil? ? '' : @label.as_hash,
      'publish_date' => @publish_date,
      'archived' => @archived,
      'publisher' => @publisher,
      'cover_state' => @cover_state
    }
  end

  def can_be_archived?
    super || @cover_state == 'bad'
  end
end
