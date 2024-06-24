# frozen_string_literal: true

class CalculateDisabilityScoreService < ApplicationService
  def calculate
    return nil if @asset[:income].zero?
    return nil if @asset[:age] > 60

    disability_score = calculate_line_score
    disability_score = get_score_for_home(disability_score)
    disability_score = get_score_for_dependents(disability_score)
    get_score_for_marital_status(disability_score)
  end

  private

  def get_score_for_home(score)
    if @asset[:house][:ownership_status] == 'rented'
      score + 1
    elsif @asset[:house][:ownership_status] == 'owned'
      score
    else
      score
    end
  end

  def get_score_for_dependents(score)
    if (@asset[:dependents]).positive?
      score + 1
    else
      score
    end
  end

  def get_score_for_marital_status(score)
    if @asset[:marital_status] == 'married'
      score - 1
    else
      score
    end
  end
end
