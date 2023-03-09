class SteamController < ApplicationController
  skip_before_action :authenticate_user!

  def connect
    redirect_to "https://steamcommunity.com/openid/login?openid.mode=checkid_setup&openid.ns=http://specs.openid.net/auth/2.0&openid.identity=http://specs.openid.net/auth/2.0/identifier_select&openid.claimed_id=http://specs.openid.net/auth/2.0/identifier_select&openid.return_to=#{steam_callback_url}", allow_other_host: true
  end

  def callback
    steam_id = params['openid.claimed_id'].split('/').last
    user = User.find_or_create_by(steam_id:)
    session['user_id'] = user.id
    ap session[:url]
    if session[:url].present?
      redirect_to session[:url]
    else
      redirect_to leagues_path
    end
  end

  def index
    @stats = nil
  end

  def get_stats
    steam_id = params[:steam_id]
    @stats = SteamService.get_user_stats(steam_id)
    render :get_stats
  end
end
