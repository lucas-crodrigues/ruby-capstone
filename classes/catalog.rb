class Catalog
  attr_reader :books, :albums, :games, :genres, :sources, :authors, :labels

  def initialize
    @books = []
    @albums = []
    @games = []
    @genres = []
    @sources = []
    @authors = []
    @labels = []
  end

  def add_book(book)
    @books << book
  end

  def add_album(album)
    @albums << album
  end

  def add_game(game)
    @games << game
  end

  def add_genre(genre)
    @genres << genre
  end

  def add_source(source)
    @sources << source
  end

  def add_author(author)
    @authors << author
  end

  def add_label(label)
    @labels << label
  end
end
