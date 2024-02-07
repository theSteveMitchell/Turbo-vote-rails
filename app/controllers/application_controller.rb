class ApplicationController < ActionController::Base
  include SessionsHelper

  def authenticate_voter!
    redirect_to new_session_url unless current_voter_id
  end
end
