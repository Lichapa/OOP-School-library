require_relative 'spec_helper'

describe Rental do
  before :each do
    person = Person.new(15, 'MJ', parent_permission: true)
    book = Book.new('Secondary Biology', 'Oyimbo')
    @rental = Rental.new('2022-02-13', book, person)
  end

  context 'Testing the rental class' do
    it 'has instance of rental' do
      expect(@rental).to be_instance_of Rental
    end

    it 'should return value date' do
      expect(@rental.date).to eql '2022-02-13'
    end

    it 'should return value for person name' do
      expect(@rental.person.name).to eql 'MJ'
    end

    it 'should return book tittle' do
      expect(@rental.book.title).to eql 'Secondary Biology'
    end

    it 'should return book author' do
      expect(@rental.book.author).to eql 'Oyimbo'
    end
  end
end
