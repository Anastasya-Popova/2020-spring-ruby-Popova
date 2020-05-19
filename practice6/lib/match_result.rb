class MatchResult
    attr_accessor :team1, :team2, :score1, :score2 
    def initialize(team1, team2, score1, score2)
        @team1 = team1
        @team2 = team2
        @score1 = Integer(score1)
        @score2 = Integer(score2)
    end
end