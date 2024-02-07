class SessionsController < ApplicationController

  # GET /sessions/new
  def new
    @voter = Voter.new
  end

  # POST /sessions
  def create
    @voter = Voter.find_by(email: voter_params[:email])
    @voter ||= Voter.new(voter_params)
    if @voter.save
      session[:current_voter_id] = @voter.id
      session[:current_voter_email] = @voter.email
      session[:create_at] = Time.current
      session[:expires_at] = 5.minutes.from_now

      redirect_to new_vote_url, notice: "Registred"
    else
      render :new, status: :unprocessable_entity
    end
  end

  # DELETE /sessions/1
  def destroy
    @voter.destroy!

    redirect_to voters_url, notice: "Voter was successfully destroyed."
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_voter
      @voter = Voter.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def voter_params
      params.require(:voter).permit(:email, :postal_code)
    end
end
