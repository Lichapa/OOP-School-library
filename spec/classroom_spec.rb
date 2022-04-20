require_relative 'spec_helper'

describe Classroom do
  before :each do
    @classroom = Classroom.new(14)
  end

  it 'should be the instance of Classroom class' do
    expect(@classroom).to be_instance_of Classroom
  end

  context 'Testing the instance variables of Classroom' do
    it 'should return label' do
      label = @classroom.label
      expect(label).to eq 14
    end
    it 'should return students' do
      students = @classroom.students
      expect(students).to eq []
    end
  end

  context 'Testing methods of Classroom' do
    it 'should add students' do
      student = Student.new(22, 'Hammas')
      @classroom.add_student(student)
      class_students = @classroom.students.length
      expect(class_students).to eq 1
    end
  end
end
