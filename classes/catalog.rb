class Catalog
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

  def add_genre
    @genres << genre
  end

  def add_source
    @sources << source
  end

  def add_author
    @authors << author
  end

  def add_label
    @labels << label
  end
end
