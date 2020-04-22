# frozen_string_literal: true

if Gem.win_platform?
  Encoding.default_external = Encoding.find(Encoding.locale_charmap)
  Encoding.default_internal = __ENCODING__

  [STDIN, STDOUT].each do |io|
    io.set_encoding(Encoding.default_external, Encoding.default_internal)
  end
end
require 'tty-prompt'
require_relative 'student'
require_relative 'student_list'
require_relative 'mark'

# The main class of our application
class Menu
  def initialize
    @prompt = TTY::Prompt.new
  end

  MAIN_MENU_CHOICES = [
    { name: 'Вывести список двоечников ', value: :twos },
    { name: 'Вывести статистику тестирования',
      value: :stat },
    { name: 'Пересчитать оченки по другой шкале',
      value: :mark },
    { name: 'Проверить на списывание',
      value: :copy },
    { name: 'Найти три самых сложный вопроса',
      value: :diff },
    { name: 'Завершить работу приложения', value: :exit }
  ].freeze

  def show_menu
    loop do
      action = @prompt.select('Выберите действие', MAIN_MENU_CHOICES)
      break if action == :exit

      show_twos if action == :twos
      show_statistics if action == :stat
      change_marks if action == :mark
      show_copied_works if action == :copy
      show_difficult_questions if action == :diff
    end
  end

  def show_twos
    # @student_list.each_student do |student|
    #    if (student.mark==:two)
    #     puts "#{student.to_s} #{student.sum}"
    #     end
    # end
  end

  def show_statistics; end

  def change_marks
    puts "балл 3:"
    a = gets.chomp
    mark.three = a
    puts "балл 4:"
    b = gets.chomp
    mark.four = b
    c = gets.chomp
    mark.five = c
    puts "балл 5:"
  end

  def show_copied_works; end

  def show_difficult_questions; end
end
