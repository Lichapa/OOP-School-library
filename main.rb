require "./app"

def main
  app = App.new
  app.start_library
end

def list_of_options
  puts
  puts "Please choose an option by entering a number"
  puts "1 - List all books"
  puts "2 - List all people"
  puts "3 - Create a person"
  puts "4 - Create a book"
  puts "5 - Create a rental"
  puts "6 - List all rentals for a given person ID"
  puts "7 - Exit"
end

def user_input
  answer = gets.chomp.to_i
  
    if answer == 1
      list_all_books
    elsif answer == 2
      list_all_people
    elsif answer == 3
      create_person
    elsif answer == 4
      create_book
    elsif answer == 5
      create_rental
    elsif answer == 6
      list_all_rentals
    elsif answer == 7
      puts "You have selected to exit the library"
      exit
    else
      puts "Enter numbers between 1 and 7"
      user_input
    end
  
end

main