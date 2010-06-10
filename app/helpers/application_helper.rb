module ApplicationHelper
  
  def interpret_point_string(point_string)
    hash = Hash.new
    hash << { :team1 => point_string.split(':').first.strip!.to_i }
    hash << { :team2 => point_string.split(':').last.strip!.to_i }
    hash
  end
  
  def interpret_score_first_half
    logger.info "ahloo"
  end
end
