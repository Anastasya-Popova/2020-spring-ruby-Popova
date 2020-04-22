# frozen_string_literal: true
require_relative '..\lib\train'
require_relative '..\lib\AllTrains'
require_relative '..\lib\TrainReader'
require 'tty-prompt'   

def choice_two
end

def timetable
    trains=TrainReader.new
    sorted=trains.sort_by{|number_of_stops| number_of_stops}
    sorted.each do |train|
        puts train.to_s_number_of_stops + train.to_s
end

def main
    result = prompt.select('Use ↑/↓ arrow keys, press Enter to select: ', per_page: 3) do |menu|
        menu.choice 'Вывести расписание движения поездов'
        menu.choice 'Вывести список поездов, отсортировав их по количеству реальных остановок'
        menu.choice 'Завершить работу приложения'
    if result == 'Вывести расписание движения поездов'
      choice_two
    elsif result == 'Вывести список поездов, отсортировав их по количеству реальных остановок'
      timetable
    else
      puts "Goodbye"
    end
end

main if __FILE__ == $PROGRAM_NAME