# frozen_string_literal: true

require_relative 'mark'
# Describes the student
class Student
  def initialize(grade, surname, name, middle_name, score = [])
    @grade = grade
    @surname = surname
    @name = name
    @middle_name = middle_name
    @score = score
  end

  def to_s
    "#{@student.grade} #{@student.surname} #{@student.name} #{@student.midle_name}"
  end

  def each_score
    return enum_for(:each_score) unless block_given?

    @score.each do |sc|
      yield sc
    end
  end

  def sum
    sum = 0
    @student.each_score do |score|
      sum += score
    end
    sum
  end

  def mark
    if @student.sum >= mark.five
      :five
    elsif @student.sum >= mark.four
      :four
    elsif @student.sum >= mark.three
      :three
    else
      :two
  end
  end
end
