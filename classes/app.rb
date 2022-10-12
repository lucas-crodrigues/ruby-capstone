require 'fileutils'
require 'json'
require_relative './catalog'
require_relative './book'
require_relative './label'
require_relative './music_album'
require_relative './genre'
require_relative './author'

class App
  def initialize
    @things = Catalog.new
    read_data
    print_menu
  end

  def choose_label
    list_labels
    puts 'Choose label by number or enter "n" to add a new label'
    input = gets.chomp
    if input.downcase == 'n'
      add_label
      return @things.labels.last
    end
    @things.labels[input.to_i] unless @things.labels[input.to_i].nil?
  end

  def choose_genre
    list_genres
    puts 'Choose genre by number or enter "n" to add a new genre'
    input = gets.chomp
    if input.downcase == 'n'
      add_genre
      return @things.genres.last
    end
    @things.genres[input.to_i] unless @things.genres[input.to_i].nil?
  end

  def add_book
    puts 'Please fill below book data:'
    puts 'Publish date:'
    publish_date = gets.chomp
    puts 'Publisher:'
    publisher = gets.chomp
    puts 'Cover state:'
    cover_state = gets.chomp
    book = Book.new(publish_date, publisher, cover_state)
    label = choose_label
    book.label = label if label.is_a? Label
    @things.add_book(book)
    puts 'Book added successfuly'
    puts 'Press enter to continue'
    gets.chomp
  end

  def add_album
    puts 'Please fill below Music Album data:'
    puts 'Publish date:'
    publish_date = gets.chomp
    puts 'Is it on Spotify? [y/n]:'
    it_is = gets[0].capitalize
    it_is = (it_is == 'Y')
    album = Album.new(publish_date, it_is)
    label = choose_label
    album.label = label if label.is_a? Label
    genre = choose_genre
    album.genre = genre if genre.is_a? Genre
    @things.add_album(album)
    puts 'Album added successfuly'
    puts 'Press enter to continue'
    gets.chomp
  end

  def add_label
    puts 'Please fill below label data:'
    print 'Title: '
    title = gets.chomp
    print 'Color: '
    color = gets.chomp
    @things.add_label(Label.new(title, color))
    puts 'Label added successfuly'
    puts 'Press enter to continue'
    gets.chomp
  end

  def add_genre
    puts 'Please fill below genre data:'
    print 'Name: '
    name = gets.chomp
    @things.add_genre(Genre.new(name))
    puts 'Genre added successfuly'
    puts 'Press enter to continue'
    gets.chomp
  end

  def list(list)
    list.each_with_index do |item, idx|
      print "#{idx}-"
      item.as_hash.each { |key, value| print "#{key}: #{value}   " unless value == '' }
      puts
    end
  end

  def read_data
    read_list('books.json') do |item|
      @things.add_book(Book.new(item['publish_date'], item['publisher'], item['cover_state']))
    end
    read_list('labels.json') { |item| @things.add_label(Label.new(item['title'], item['color'])) }
    read_list('albums.json') { |item| @things.add_album(Album.new(item['publish_date'], item['on_spotify'])) }
    read_list('genres.json') { |item| @things.add_genre(Genre.new(item['name'])) }
  end

  def read_list(file_name, &block)
    return unless File.exist?("./app_data/#{file_name}")

    items = JSON.parse(File.read("./app_data/#{file_name}"))

    items.each(&block)
  end

  def save_data
    save_list('books.json', @things.books)
    save_list('labels.json', @things.labels)
    save_list('genres.json', @things.genres)
    save_list('albums.json', @things.albums)
  end

  def save_list(file_name, list)
    FileUtils.mkdir_p('./app_data/')
    FileUtils.cd('./app_data/') do
      # generate json object
      list_json = []
      list.each { |item| list_json << item.as_hash }

      # write data to their respective files
      File.write(file_name, JSON.pretty_generate(list_json))
    end
  end

  def list_books
    puts '------------Books List-----------'
    list(@things.books)
    puts '----------End of the List----------'
    puts 'Press enter to continue'
    gets.chomp
  end

  def list_albums
    puts '------------Albums List-----------'
    list(@things.albums)
    puts '----------End of the List----------'
  end

  def list_labels
    puts '------------Labels List-----------'
    list(@things.labels)
    puts '----------End of the List----------'
  end

  def list_genres
    puts '------------Genres List-----------'
    list(@things.genres)
    puts '----------End of the List----------'
  end

  def options
    {
      1 => { text: 'List all books', action: proc { list_books } },
      2 => { text: 'List all Music Albums', action: proc do
                                                      list_albums
                                                      puts 'Press enter to continue'
                                                      gets.chomp
                                                    end },
      3 => { text: 'List all Games', action: proc { puts 'Method not implemented yet' } },
      4 => { text: 'List all Genres', action: proc { list_genres } },
      5 => { text: 'List all Labels', action: proc { list_labels } },
      6 => { text: 'List all Authors', action: proc { puts 'Method not implemented yet' } },
      7 => { text: 'List all Sources', action: proc { puts 'Method not implemented yet' } },
      8 => { text: 'Add a Book', action: proc { add_book } },
      9 => { text: 'Add a Music Album', action: proc { add_album } },
      10 => { text: 'Add a Game', action: proc { puts 'Method not implemented yet' } },
      11 => { text: 'Add a Label', action: proc { add_label } },
      12 => { text: 'Add a Genre', action: proc { add_genre } },
      13 => { text: 'Exit App', action: proc { puts 'Method not implemented yet' } }
    }
  end

  def print_menu
    loop do
      options.each { |k, v| print "#{k} - #{v[:text]} \n" }
      choice = gets.chomp.to_i
      if choice == options.keys.last
        puts "\nThank you for using the app\n"
        save_data
        break
      end
      puts "\e[H\e[2J"
      choice_menu(choice)
    end
  end

  def choice_menu(choice)
    return unless options.keys.include?(choice)

    options[choice][:action].call
  end
end
