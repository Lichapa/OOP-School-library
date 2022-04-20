require './modules/preserve_data'
module AppBooks
  include ProcessData
  def list_all_books(books)
    puts 'Database is empty! Add a book.' if books.empty?
    books.each { |book| puts "[Book] Title: #{book.title}, Author: #{book.author}" }
  end

  def book_inputs
    puts 'Create a new book'
    input(['Enter title', 'Enter author'])
  end

  def create_book(books)
    inputs = book_inputs
    books.push(Book.new(inputs[0], inputs[1]))
    book_data = { title: inputs[0], author: inputs[1] }
    update_data('books', book_data)
    puts "Book #{inputs[0]} created successfully."
  end
end
