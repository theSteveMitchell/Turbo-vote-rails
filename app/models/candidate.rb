class Candidate < ApplicationRecord
  MAXIMUM_CANDIDATES = 10
  validates :name, presence: true, uniqueness: true
  validate :maximum_candidates, on: :create
  
  # We omit dependent: :destroy, we should not be able to delete a candidate if they have votes
  has_many :votes

  def maximum_candidates
    if Candidate.count >= MAXIMUM_CANDIDATES
      votes.first.errors.add(:candidate, "too many candidates, cannot write-in.")
    end
  end
end
