class ApplicationController < ActionController::Base
  before_filter :authorize

  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  private

  def authorize
    unless Team.find_by_id(session[:team_id])
      redirect_to login_url, alert: "ログインしてください"
    end
  end
end
