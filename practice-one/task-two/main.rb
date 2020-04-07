require "json" 
require_relative "fleet" 
require_relative "auto" 

def main 
puts "Эта программа симулирует работу автомобильного парка прокатной компании" 
auto_one= Auto.new("Reno","Logan",2014,5.5); 
puts auto_one.to_s 
fleet = Fleet.new 
fleet.load_from_file("cars-list.json") 
puts fleet.consumption_by_brand("BMW") 
puts fleet.number_by_model("A5 2,0i") 
puts fleet.number_by_brand("BMW") 
puts fleet.average_consumption 
end 

if __FILE__ == $0 
main 
end