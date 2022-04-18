module AppRentals
  def create_rental(rentals, books, people)
    puts 'Select which book you want to rent by entering its number'
    books.each_with_index { |book, index| puts "#{index}) Title: #{book.title}, Author: #{book.author}" }

    book_id = gets.chomp.to_i

    puts 'Select a person from the list by its number'
    people.each_with_index do |person, index|
      puts "#{index}) [#{person.class.name}] Name: #{person.name}, ID: #{person.id}, Age: #{person.age}"
    end

    person_id = gets.chomp.to_i

    date = input(['date'])

    rentals.push(Rental.new(date[0], books[book_id], people[person_id]))
    puts 'Rental created successfully'
  end

  def list_all_rentals(rentals, _books, people)
    if rentals.empty?
      puts 'No one has borrowed a book.'
    else

      puts 'People IDs'
      people.each do |person|
        puts "id: #{person.id}"
      end

      id = input(['Choose an ID to see their rentals'])

      puts 'Rented Books:'
      rentals.each do |rental|
        if rental.person.id == id[0].to_i
          puts "Peson: #{rental.person.name}  Date: #{rental.date},
          Book: '#{rental.book.title}' by #{rental.book.author}"
        else
          puts 'No records where found for the given ID'
        end
      end
    end
  end
end
