class CandidatesController < ApplicationController
  before_action :set_candidate, only: :show

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

    if @candidate.save
      redirect_to candidate_url(@candidate), notice: "Candidate was successfully created."
    else
      render :new, status: :unprocessable_entity
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_candidate
      @candidate = Candidate.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def candidate_params
      params.require(:candidate).permit(:name)
    end
end
