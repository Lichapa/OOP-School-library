require './person'

class Student < Person
  def initialize(classroom, name = 'unknown')
    super(age, parent_permission, name)
    @classroom = classroom
  end

  def play_hooky
    "¯\(ツ)/¯"
  end
end
