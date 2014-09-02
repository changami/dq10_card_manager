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

  def current_team
    Team.find_by_id(session[:team_id])
  rescue ActiveRecord::RecordNotFound
    redirect_to login_url, alert: "セッション情報の取得に失敗しました、再度ログインしてください。"
  end
end
