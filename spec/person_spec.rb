require_relative 'spec_helper'

describe Person do
  before :each do
    @person = Person.new(22, 'Hammas')
  end

  it 'should be the instance of Person class' do
    expect(@person).to be_instance_of Person
  end

  context 'Testing the instance variables of Person' do
    it 'should return age' do
      age = @person.age
      expect(age).to eq 22
    end
    it 'should return name' do
      name = @person.name
      expect(name).to eq 'Hammas'
    end
    it 'should return parent permission' do
      parent_permission = @person.parent_permission
      expect(parent_permission).to eq true
    end
    it 'should return rentals' do
      rentals = @person.rentals
      expect(rentals).to eq []
    end
  end

  context 'Testing methods of Person' do
    it 'should return correct name' do
      correct_name = @person.correct_name
      expect(correct_name).to eq 'Hammas'
    end

    it 'should return service permit' do
      service_usage = @person.can_use_services?
      expect(service_usage).to eq true
    end
    it 'should add rental to person' do
      book = Book.new('JavaScript', 'Mphatso')
      @person.add_rental(book, '2022-04-20')
      rental = @person.rentals.length
      expect(rental).to eq 1
    end
  end
end
