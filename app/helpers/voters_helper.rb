module VotersHelper
  def current_voter_email
    session[:current_voter_email]
  end

  def session_active?
    session[:expires_at] && session[:expires_at] > Time.current
  end
end
