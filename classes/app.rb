require_relative './catalog'

class App
  def initialize
    @things = Catalog.new
    # read_data
    print_menu
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
        # save_data
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
      10
    when 11
      11
    when 12
      12
    else
      puts "\nPlease input a valid option\n"
    end
  end
end
