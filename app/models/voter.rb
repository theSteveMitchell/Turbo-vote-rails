class Voter < ApplicationRecord
  has_one :vote
  validates :email, presence: true, uniqueness: true
end
