class Candidate < ApplicationRecord
  validates :name, presence: true

  has_many :votes
end
