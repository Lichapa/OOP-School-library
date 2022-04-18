require './person'
require './student'
require './teacher'
require './book'
require './classroom'
require './rental'
require './modules/input'
require './modules/app_books'

class App
  include Input
  include AppBooks
  # def initialize
  #   @books = []
  #   @people = []
  #   @rentals = []
  #   @classroom = 'microverse'
  # end

  # def start_library
  #   puts 'Welcome to my School Library!'
  #   until list_of_options
  #     answer = gets.chomp.to_i
  #     if answer == 7
  #       puts 'You have selected exit! bye'
  #       exit
  #     end

  #     user_input answer
  #   end
  # end

  # def list_all_books
  #   puts 'Database is empty! Add a book.' if @books.empty?
  #   @books.each { |book| puts "[Book] Title: #{book.title}, Author: #{book.author}" }
  # end

  def list_all_people
    puts 'Database is empty! Add a person.' if @people.empty?
    @people.each do |person|
      puts "[#{person.class.name}] Name: #{person.name}, Age: #{person.age}, id: #{person.id}"
    end
  end

  def create_person
    option = input(['To create a student, press 1, to create a teacher, press 2'])
    case option[0]
    when '1'
      create_student
    when '2'
      create_teacher
    else
      puts 'Invalid input. Try again'
    end
  end

  def create_student
    puts 'Create a new student'
    inputs = input(['Enter student age', 'Enter name', 'Has parent permission? [Y/N]'])
    case inputs[2].downcase
    when 'n'
      puts 'Student does not have parent permission, can not rent books'
    when 'y'
      @people.push(Student.new(@classroom, inputs[0], inputs[1]))
      puts 'Student created successfully'
    end
  end

  def create_teacher
    puts 'Create a new teacher'
    inputs = input(['Enter teacher age', 'Enter teacher name', 'Enter teacher specialization'])
    @people.push(Teacher.new(inputs[2], inputs[0], inputs[1]))
    puts 'Teacher created successfully'
  end

  # def create_book()
  #   puts 'Create a new book'
  #   inputs = input(['Enter title', 'Enter author' ])
  #   @books.push(Book.new(inputs[0], inputs[1]))
  #   puts "Book #{inputs[0]} created successfully."
  # end

  def create_rental
    puts 'Select which book you want to rent by entering its number'
    @books.each_with_index { |book, index| puts "#{index}) Title: #{book.title}, Author: #{book.author}" }

    book_id = gets.chomp.to_i

    puts 'Select a person from the list by its number'
    @people.each_with_index do |person, index|
      puts "#{index}) [#{person.class.name}] Name: #{person.name}, ID: #{person.id}, Age: #{person.age}"
    end

    person_id = gets.chomp.to_i

    print 'Date: '
    date = gets.chomp.to_s

    @rentals.push(Rental.new(date, @books[book_id], @people[person_id]))
    puts 'Rental created successfully'
  end

  def list_all_rentals
    puts 'To see person rentals enter the person ID: '
    @people.each do |person|
      puts "id: #{person.id}"
    end
    id = gets.chomp.to_i
    puts 'Rented Books:'
    @rentals.each do |rental|
      if rental.person.id == id
        puts "Peson: #{rental.person.name}  Date: #{rental.date}, Book: '#{rental.book.title}' by #{rental.book.author}"
      else
        puts
        puts 'No records where found for the given ID'
      end
    end
  end
end
