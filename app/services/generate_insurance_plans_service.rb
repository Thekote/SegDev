class GenerateInsurancePlansService
  def initialize(asset)
    @asset = asset
  end

  def generate_scores
    auto_score = CalculateAutoScoreService.new(@asset).calculate
    life_score = CalculateLifeScoreService.new(@asset).calculate
    home_score = CalculateHomeScoreService.new(@asset).calculate
    disability_score = CalculateDisabilityScoreService.new(@asset).calculate

    build_insurance_profile(auto_score, life_score, disability_score, home_score)
  end

  private

  def build_insurance_profile(auto_score, life_score, disability_score, home_score)
    profile = {
      auto: score_to_symbol(auto_score),
      disability: score_to_symbol(disability_score),
      home: score_to_symbol(home_score),
      life: score_to_symbol(life_score)
    }
  end

  def score_to_symbol(score)
    return 'inelegivel' if score.nil?
     
    case 
    when score <= 0
      return 'economico'
    when score == 1 || score == 2
      return 'padrao'
    else
      return 'avancado'
    end
  end
end
