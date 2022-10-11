class Catalog
  def initialize
    @books = []
    @albums = []
    @games = []
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
end
