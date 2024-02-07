module SessionsHelper
  def current_voter_email
    session[:current_voter_email]
  end

  def session_active?
    session[:expires_at] && session[:expires_at] > Time.current
  end

  def current_voter_id
    session[:current_voter_id]
  end
end
