require './app'

class Main
  def initialize
    @books = []
  end

  def main
    start_library
  end

  def list_of_options
    puts
    puts 'Please choose an option by entering a number'
    puts '1 - List all books'
    puts '2 - List all people'
    puts '3 - Create a person'
    puts '4 - Create a book'
    puts '5 - Create a rental'
    puts '6 - List all rentals for a given person ID'
    puts '7 - Exit'
  end

  def start_library
    puts 'Welcome to my School Library!'
    until list_of_options
      answer = gets.chomp.to_i
      if answer == 7
        puts 'You have selected exit! bye'
        exit
      end

      user_input answer
    end
  end

  def user_input(answer)
    case answer
    when 1
      App.new.list_all_books(@books)
    when 2
      App.new.list_all_people
    when 3
      App.new.create_person
    when 4
      App.new.create_book(@books)
    when 5
      App.new.create_rental
    when 6
      App.new.list_all_rentals
    else
      puts 'Enter numbers between 1 and 7'
    end
  end
end

Main.new.main
