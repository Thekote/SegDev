FactoryBot.define do
  factory :user do
    age { 35 }
    dependents { 2 }
    income { 0 }
    marital_status { 'married' }
    risk_questions { [0, 1, 0] }

    house { association :house, user: instance }
    vehicle { association :vehicle, user: instance }
  end
end
