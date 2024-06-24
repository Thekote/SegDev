# frozen_string_literal: true

class Vehicle < ApplicationRecord
  belongs_to :user

  validates :year, numericality: { only_integer: true }
  validates :user, associated: true
end
