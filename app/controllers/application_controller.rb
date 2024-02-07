class ApplicationController < ActionController::Base
  include SessionsHelper

  def authenticate_voter!
    redirect_to new_session_url unless session_active?
  end
end
