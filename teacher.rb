require './person'

class Teacher < Person
  attr_accessor :type

  def initialize(specialization, age, name = 'unknown', parent_permission: true)
    @specialization = specialization
    @type = 'Teacher'
    super(age, name, parent_permission: parent_permission)
  end

  def can_use_services?
    true
  end
end
