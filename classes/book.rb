require_relative './item.rb'

class Book << Item
  def initialize(publish_date,publisher, cover_state)
    super(publish_date)
    @publisher = publisher
    @cover_state = cover_state
  end

  def as_hash
    {
      'id'=> @id,
      'genre' => @genre,
      'author' => @author,
      'source' => @source,
      'label' => @label,
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