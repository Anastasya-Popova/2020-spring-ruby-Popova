require_relative "competition.rb"
class Table
    def initialize
        @cmp = Competition.new
    end

    def draw_table

        print "%12s" % [""]
        @cmp.iterator_sorted_by_names do |team|
            print "%12s " % [team]
        end

        @cmp.iterator_sorted_by_names do |team1|
            puts "%12s" % [""]
            print "%12s" % [team1]
            @cmp.iterator_sorted_by_names do |team2|

                score = ""
                res = @cmp.matches.select{|t| t.team1 == team1 && t.team2 == team2 || t.team2 == team1 && t.team1 == team2}.first
                if(res!=nil)
                    if( res.team1 == team1 && res.team2 == team2)
                        score = "#{res.score1}/ #{res.score2 }"
                    
                    else
                        score = "#{res.score2}/ #{res.score1 }"
                    end

                end
                print "%12s " % [score]

            end
            puts "%12s" % [""]
        end


    end
end

t = Table.new

t.draw_table