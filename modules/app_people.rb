require './modules/preserve_data'

module AppPeople
  include ProcessData
  def list_all_people(people)
    puts 'Database is empty! Add a person.' if people.empty?
    people.each do |person|
      puts "[#{person.type}], Name: #{person.name}, Age: #{person.age}, id: #{person.id}"
    end
  end

  def create_person(people)
    option = input(['To create a student, press 1, to create a teacher, press 2'])
    case option[0]
    when '1'
      create_student people
    when '2'
      create_teacher people
    else
      puts 'Invalid input. Try again'
    end
  end

  def student_inputs
    puts 'Create a new student'
    input(['Enter student age', 'Enter name', 'Has parent permission? [Y/N]'])
  end

  def create_student(people)
    classroom = 'Microverse'
    role = 'Student'
    inputs = student_inputs
    case inputs[2].downcase
    when 'n'
      puts 'Student does not have parent permission, can not rent books'
    when 'y'
      person = Student.new(classroom, inputs[0], inputs[1])
      people.push(person)
      person_data = { id: person.id, role: role, age: person.age, name: person.name }
      update_data('people', person_data)
      puts 'Student created successfully'
    end
  end

  def teacher_inputs
    puts 'Create a new teacher'
    input(['Enter teacher age', 'Enter teacher name', 'Enter teacher specialization'])
  end

  def create_teacher(people)
    role = 'Teacher'
    inputs = teacher_inputs
    person = Teacher.new(inputs[2], inputs[0], inputs[1])
    people.push(person)
    person_data = { id: person.id, role: role, age: person.age, name: person.name,
                    specialization: inputs[2] }
    update_data('people', person_data)
    puts 'Teacher created successfully'
  end
end
