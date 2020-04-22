require '..stops'

require_relative 'AllTrains'
require_relative 'Train'


class TrainReader
    def read_in_alltrains(*filenames) 
        AllTrains = AllTrains.new 
        filenames.each do |filename| 
        CSV.foreach(filename, headers: true) do |row| 
        number=row 
        train.add_train(Train.new( 
        row['TRAINID'], Float(row['']) 
        )) 
        end 
        end 
        Trains 
    end 
 end