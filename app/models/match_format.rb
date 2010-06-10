module MatchFormat
  def score
    "#{goals_team_1}:#{goals_team_2}"
  end
  
  def score=(score)
    scores = score.split(':', 2)
    self.goals_team_1 = scores.first
    self.goals_team_2 = scores.last
  end
  
  def half_time_score
    "#{goals_first_half_team_1}:#{goals_first_half_team_2}"
  end
  
  def half_time_score=(score)
    scores = score.split(':', 2)
    self.goals_first_half_team_1 = scores.first
    self.goals_first_half_team_2 = scores.last
  end
end