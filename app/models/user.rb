class User < ApplicationRecord
  has_one :house
  has_one :vehicle

  enum marital_status: { single: "single", married: "married" }

  accepts_nested_attributes_for :house, :vehicle

  validates :age, presence: true, numericality: { greater_than: 0}
  validates :dependents, presence: true, numericality: { greater_than_or_equal_to: 0}
  validates :income, presence: true, numericality: { greater_than_or_equal_to: 0}
  validates :marital_status, presence: true, inclusion: { in: %w[single married]}
  validates :risk_questions, presence: true
end
