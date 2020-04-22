# frozen_string_literal: true

# Holds a list of student
class StudentList
  def initialize(students = [])
    @students = students
  end

  def add_student(student)
    @students.append(student)
  end

  def each_student
    @students.each do |student|
      yield student
    end
  end
end
