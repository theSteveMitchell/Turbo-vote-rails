class CandidatesController < ApplicationController

  # GET /candidates or /candidates.json
  def index
    @candidates = Candidate.all
  end

  # GET /candidates/new
  def new
    @candidate = Candidate.new
  end

  # POST /candidates or /candidates.json
  def create
    @candidate = Candidate.new(candidate_params)
    @candidate.votes.build
    
    if @candidate.save
      redirect_to votes_url, notice: "Candidate was successfully created."
    else
      render :new, status: :unprocessable_entity
    end
  end

  private
    # Only allow a list of trusted parameters through.
    def candidate_params
      params.require(:candidate).permit(:name)
    end
end
