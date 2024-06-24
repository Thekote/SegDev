# frozen_string_literal: true

FactoryBot.define do
  factory :asset, class: Hash do
    age { 35 }
    dependents { 2 }
    house { { ownership_status: 'owned' } }
    income { 100_000 }
    marital_status { 'married' }
    risk_questions { [0, 1, 0] }
    vehicle { { year: 2018 } }

    initialize_with { attributes }
  end
end
