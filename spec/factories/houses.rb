# frozen_string_literal: true

FactoryBot.define do
  factory :house do
    ownership_status { 'owned' }
    user
  end
end
