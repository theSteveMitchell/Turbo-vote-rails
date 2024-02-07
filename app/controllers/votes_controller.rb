class VotesController < ApplicationController
  VOTE_MASK = 10

  # GET /votes or /votes.json
  # lists vote tallies, but only update after every 10 votes
  # e.g when 12 votes are counted, we tally only the first 10. when 89 votes counted, we tally only the first 80.
  # this is for voter privacy - onlookers can't infer a single vote by watching for update
  # 
  # pluck() pulls the AR::Relation into an array in memory, so this won't scale well beyond a few thousand votes.
  def index
    reveal_count = Vote.count - (Vote.count % VOTE_MASK)
    @vote_counts = Vote.limit(reveal_count).includes(:candidate).pluck("candidates.name")
      .sort.tally.map do |k,v|
      {candidate_name: k, votes: v}
    end
  end

  # GET /votes/new
  def new
    @vote = Vote.new
  end

  # POST /votes
  def create
    @vote = Vote.new(vote_params)

    if @vote.save
      redirect_to votes_url, notice: "Vote was successfully created."
    else
      render :new, status: :unprocessable_entity
    end
  end

  private
    # Only allow a list of trusted parameters through.
    def vote_params
      params.require(:vote).permit(:candidate_id)
    end
end
