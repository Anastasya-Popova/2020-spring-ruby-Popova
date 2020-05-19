require_relative "match_result.rb"
require "csv"
class Competition
    def initialize
        @matches = []
        
        self.load_data
        @teams = get_all_teams
        #pp @teams
    end

    def load_data
        data = CSV.parse(File.read(__dir__+"/../data/2019-ti-group-stage.csv"));
        data.each do |row|
            @matches.push(MatchResult.new(row[0], row[1],row[2],row[3]));
        end
    end

    def get_all_teams
        teams = Hash.new(0)
        @matches.each do |match|
            teams[match.team1]+=match.score1
            teams[match.team2]+=match.score2
        end
        teams.to_a
    end

    def iterator_sorted_by_names
        arr = @teams.map{|t| t[0]}.sort
        return arr.each unless block_given?

        arr.each do |t|
             yield t
        end
    end

    def iterator_sorted_by_score
        arr = @teams.sort{|a, b| a[1]<=>b[1]}.map{|t| t[0]}
        return arr.each unless block_given?

        arr.each do |t|
             yield t
        end
    end

    def matches
        return @matches.each unless block_given?

        @matches.each do |t|
             yield t
        end
    end

    def remove_if
        return "biba" unless block_given?

        @matches.delete_if do |t|
            yield t
       end
    end

    def add(match)
        @matches.push(match);
    end
end
