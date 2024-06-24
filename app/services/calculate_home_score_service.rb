class CalculateHomeScoreService < ApplicationService
  def calculate
    return nil if @asset[:house].empty?
      
    home_score = calculate_line_score
    home_score = get_score_for_home(home_score)

    home_score
  end

  private
  
  def get_score_for_home(score)
    if @asset[:house][:ownership_status] == "rented"
      score += 1
    elsif  @asset[:house][:ownership_status] == "owned"
      score
    else
      score
    end
  end
end
