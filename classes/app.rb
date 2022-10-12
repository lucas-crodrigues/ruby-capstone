require 'fileutils'
require 'json'
require_relative './catalog'
require_relative './book'
require_relative './label'

class App
  def initialize
    @things = Catalog.new
    # read_data
    print_menu
  end

  def add_book
    puts 'Please fill below book data:'
    puts 'Publish date:'
    publish_date = gets.chomp
    puts 'Publesher:'
    publisher = gets.chomp
    puts 'Cover state:'
    cover_state = gets.chomp
    @things.add_book(Book.new(publish_date, publisher, cover_state))
  end

  def read_data
    if File.exist?('./app_data/books.json')
      books = []
      File.foreach('./app_data/books.json') { |book| books << JSON.parse(book) }
      books.each do |book|
        book.each do |b|
          @things.add_book(Book.new(JSON.parse(b)['publish_date'], JSON.parse(b)['publisher'],
                                    JSON.parse(book)['cover_state']))
        end
      end
    end

    return unless File.exist?('./app_data/labels.json')

    labels = []
    File.foreach('./app_data/labels.json') { |label| labels << JSON.parse(label) }
    labels.each do |label|
      label.each do |l|
        @things.add_label(Label.new(JSON.parse(l)['title'], JSON.parse(l)['color']))
      end
    end
  end

  def save_data
    save_list('books.json', @things.books)
    save_list('labels.json', @things.labels)

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

  def print_menu
    options = {
      1 => 'List all Books',
      2 => 'List all Music Albums',
      3 => 'List all Games',
      4 => 'List all Genres',
      5 => 'List all Tables',
      6 => 'List all Labels',
      7 => 'List all Authors',
      8 => 'List all Sources',
      10 => 'Add a Book',
      11 => 'Add a Music Album',
      12 => 'Add a Game',
      13 => 'Exit App'
    }
    loop do
      options.each { |k, v| print "#{k} - #{v} \n" }
      choice = gets.chomp.to_i
      if choice == 13
        puts "\nThank you for using the app\n"
        save_data
        break
      end
      choice_menu(choice)
    end
  end

  def choice_menu(choice) # rubocop:disable Metrics/CyclomaticComplexity
    case choice
    when 1
      1
    when 2
      2
    when 3
      3
    when 4
      4
    when 5
      5
    when 6
      6
    when 7
      7
    when 8
      8
    when 9
      9
    when 10
      add_book
    when 11
      11
    when 12
      12
    else
      puts "\nPlease input a valid option\n"
    end
  end
end
