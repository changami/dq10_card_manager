class SessionsController < ApplicationController
  def new
  end

  def create
    team = Team.find_by_name(params[:name])
    if team and team.authenticate(params[:password])
      session[:team_id] = team.id
      redirect_to cards_url
    else
      redirect_to login_url, alert: "無効なチーム / パスワードの組み合わせです"
    end
  end

  def destroy
    session[:team_id] = nil
    redirect_to login_url, alert: "ログアウト"
  end
end
