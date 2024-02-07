module VotesHelper
  def write_in_allowed
    Candidate.count < Candidate::MAXIMUM_CANDIDATES
  end
end
