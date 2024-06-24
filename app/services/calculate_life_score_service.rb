# frozen_string_literal: true

class CalculateLifeScoreService < ApplicationService
  def calculate
    return nil if @asset[:age] > 60

    life_score = calculate_line_score
    life_score = get_score_for_dependents(life_score)
    get_score_for_marital_status(life_score)
  end

  private

  def get_score_for_dependents(score)
    if (@asset[:dependents]).positive?
      score + 1
    else
      score
    end
  end

  def get_score_for_marital_status(score)
    if @asset[:marital_status] == 'married'
      score + 1
    elsif @asset[:marital_status] == 'single'
      score
    else
      score
    end
  end
end
