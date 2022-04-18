module AppBooks
  def list_all_books(books)
    puts 'Database is empty! Add a book.' if books.empty?
    books.each { |book| puts "[Book] Title: #{book.title}, Author: #{book.author}" }
  end

  def create_book(books)
    puts 'Create a new book'
    inputs = input(['Enter title', 'Enter author'])
    books.push(Book.new(inputs[0], inputs[1]))
    puts "Book #{inputs[0]} created successfully."
  end
end
