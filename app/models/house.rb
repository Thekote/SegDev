# frozen_string_literal: true

class House < ApplicationRecord
  belongs_to :user

  enum ownership_status: { owned: 'owned', rented: 'rented' }

  validates :ownership_status, inclusion: { in: %w[owned rented] }
  validates :user, associated: true
end
