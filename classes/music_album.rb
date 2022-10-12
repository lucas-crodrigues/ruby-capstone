require_relative './item'

class Album < Item
  attr_accessor :on_spotify

  def initialize(publish_date, on_spotify)
    super(publish_date)
    @on_spotify = on_spotify
  end

  def as_hash
    {
      'id' => @id,
      'genre' => @genre.nil? ? '' : @genre.as_hash,
      'author' => @author.nil? ? '' : @author.as_hash,
      'source' => @source.nil? ? '' : @source,
      'label' => @label.nil? ? '' : @label.as_hash,
      'publish_date' => @publish_date,
      'archived' => @archived,
      'on_spotify' => @on_spotify
    }
  end

  private

  def can_be_archived?
    super && @on_spotify
  end
end
