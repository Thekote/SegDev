class CalculateAutoScoreService < ApplicationService
  YEARS_AMOUNT_LIMIT = 5

  def calculate
    return nil if @asset[:vehicle].empty?

    auto_score = calculate_line_score
    auto_score = get_score_for_vehicle(auto_score)

    auto_score
  end

  private
  
  def get_score_for_vehicle(score)
    if @asset[:vehicle][:year] >= Date.today.year-YEARS_AMOUNT_LIMIT
      score += 1
    else
      score
    end
  end
end
