# frozen_string_literal: true

# Class for train
class Train
attr_reader :number, :departure_station,:arrial_station
attr_reader :departure_time,:arrial_time,:number_of_stops

def initialize(departure_station,arrial_station,attr_reader departure_time,arrial_time)
    @number=number
    @departure_station=departure_station
    @arrial_station=arrial_station
    @departure_time=departure_time
    @arrial_time=arrial_time
    @number_of_stops=number_of_stops
end

def to_s
    "Train '#{@number}': #{@departure_station} (#{@departure_time})   #{@arrial_station} (#{@arrial_time})"   
end

def to_s_number_of_stops
    "Stops'#{@number_of_stops}' "   
end
