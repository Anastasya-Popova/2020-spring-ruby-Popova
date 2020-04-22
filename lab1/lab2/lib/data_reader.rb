# frozen_string_literal: true

require 'csv'

require_relative 'student_list'
require_relative 'student'

# Module reads CSV data into files
module DataReader
  STUDENT_FILE = File.expand_path('../data/test_results.csv', __dir__)

  def self.read_students
    student_list = StudentList.new
    CSV.foreach(STUDENT_FILE, headers: true, encoding: 'utf-8') do |row|
      student = Student.new(row[0]...row[44])
      student_list.add_student(student)
    end
    students
  end
end
