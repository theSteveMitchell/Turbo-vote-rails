class VotesController < ApplicationController

  # GET /votes or /votes.json
  def index
    @vote_counts = Vote.joins(:candidate).group("candidates.name").count.map do |k,v|
      {candidate_name: k, votes: v}
    end
  end

  # GET /votes/new
  def new
    @vote = Vote.new
  end

  # POST /votes or /votes.json
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
