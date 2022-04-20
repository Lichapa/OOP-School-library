require_relative 'spec_helper'

describe Book do
  before :each do
    @book = Book.new('JavaScript', 'Hammas')
  end

  it 'should be the instance of Book class' do
    expect(@book).to be_instance_of Book
  end

  context 'Testing the instance variables of Book' do
    it 'should return title' do
      title = @book.title
      expect(title).to eq 'JavaScript'
    end
    it 'should return title' do
      rental = @book.rentals
      expect(rental).to eq []
    end
    it 'should return title' do
      author = @book.author
      expect(author).to eq 'Hammas'
    end
  end
end
