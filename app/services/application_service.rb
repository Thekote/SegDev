class ApplicationService
  def initialize(asset)
    @asset = asset
  end

  def calculate_line_score
    score = @asset[:risk_questions].sum

    score = get_score_for_age(score)
    score = get_score_for_income(score)

    score
  end

  private
  
  def get_score_for_age(score)
    if @asset[:age] < 30
      score -= 2
    elsif @asset[:age] > 30 && @asset[:age] < 40
      score -= 1
    else
      score
    end
  end

  def get_score_for_income(score)
    if @asset[:income] > 200000
      score -= 1      
    else
      score
    end
  end
end
