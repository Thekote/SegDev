# frozen_string_literal: true

Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      post '/insurance/calculate', to: 'insurances_calculator#calculate_final_scores'
    end
  end
end
