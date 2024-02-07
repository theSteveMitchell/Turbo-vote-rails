class Voter < ApplicationRecord
  has_one :vote
  validates :name, presence: true, uniqueness: true
end
