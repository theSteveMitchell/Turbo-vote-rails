class VotesController < ApplicationController
  before_action :set_vote, only: :show

  # GET /votes or /votes.json
  def index
    @votes = Vote.all
  end

  # GET /votes/new
  def new
    @vote = Vote.new
  end

  # POST /votes or /votes.json
  def create
    @vote = Vote.new(vote_params)

    if @vote.save
      redirect_to vote_url(@vote), notice: "Vote was successfully created."
    else
      render :new, status: :unprocessable_entity
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_vote
      @vote = Vote.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def vote_params
      params.require(:vote).permit(:candidate_id)
    end
end
