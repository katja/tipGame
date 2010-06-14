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
  
  def winner
    if self.goals_team_1 < self.goals_team_2
      return 2
    elsif self.goals_team_1 > self.goals_team_2
      return 1
    else
      return 0
    end
  end
  
  def goals_diff
    self.goals_team_1 - self.goals_team_2
  end
  
  def final_score
    [self.goals_team_1, self.goals_team_2]
  end
  
  def has_goals?
    goals_team_1 && goals_team_2
  end
  
end