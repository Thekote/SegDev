class House < ApplicationRecord
  belongs_to :user

  enum ownership_status: { owned: 0, rented: 1 }

  validates :ownership_status, inclusion: { in: %w[owned rented]}
  validates :user, associated: true
end
