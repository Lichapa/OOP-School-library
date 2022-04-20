require_relative 'spec_helper'

describe Student do
  before :each do
    @student = Student.new(3, 4, "Marion")
  end

  context 'Testing the student class' do
    it 'has instance of student' do
      expect(@student).to be_instance_of Student
    end

    it 'has age value age' do
      expect(@student.age).to eql (4)
    end

    it 'should return a name value' do
      expect(@student.name).to eql 'Marion'
    end

    it 'Should return classrom value' do
      expect(@student.classroom).to eql (3)
    end

    it 'Should have parent permission' do
      expect(@student.parent_permission).to eql true
    end

    it 'Should return rentals' do
      expect(@student.rentals).to eql []
    end

    it 'Should return type' do
      expect(@student.type).to eql 'Student'
    end

  end
end