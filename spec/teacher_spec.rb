require_relative 'spec_helper'

describe Teacher do
  before :each do
    @teacher = Teacher.new('IT', 30, 'Mphatso')
  end

  context 'Testing the teacher class' do
    it 'has instance of teacher' do
      expect(@teacher).to be_instance_of Teacher
    end

    it 'has age value age' do
      expect(@teacher.age).to eql(30)
    end

    it 'The name will return a value' do
      expect(@teacher.name).to eql 'Mphatso'
    end

    it 'The specialization will return value' do
      expect(@teacher.specialization).to eql 'IT'
    end

    it 'Should have parent permission' do
      expect(@teacher.parent_permission).to eql true
    end

    it 'Should return rentals' do
      expect(@teacher.rentals).to eql []
    end

    it 'Should return type' do
      expect(@teacher.type).to eql 'Teacher'
    end

    it 'should return service permit' do
      expect(@teacher.can_use_services?).to eq true
    end
  end
end
