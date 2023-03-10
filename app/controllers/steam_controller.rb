class SteamController < ApplicationController
  skip_before_action :authenticate_user!

  def connect
    redirect_to "https://steamcommunity.com/openid/login?openid.mode=checkid_setup&openid.ns=http://specs.openid.net/auth/2.0&openid.identity=http://specs.openid.net/auth/2.0/identifier_select&openid.claimed_id=http://specs.openid.net/auth/2.0/identifier_select&openid.return_to=#{steam_callback_url}", allow_other_host: true
  end

  def callback
    steam_id = params['openid.claimed_id'].split('/').last
    user = User.find_or_create_by(steam_id:)
    get_stats(steam_id)
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

  def get_stats(steam_id)
    @user_stats = SteamService.get_user_stats('76561197981067382')
    user = User.find_by(steam_id: '76561197981067382')
    if @user_stats.first.nil?
      return
    else
      if Stat.find_by(user: user).present?
        # update_stat(@user_stats, user)
        return
      else
        @user_stats.each do |user_stat|
          key = user_stat.keys
          game_name = user_stat[key[1]]
          stats = user_stat[key[2]]
          stats.each do |stat|
            type = key[2]
            Stat.create(gameName: game_name, genre: type, name: stat["name"], value: stat["value"], user: user)
          end
        end
      end
    end
    # render :get_stats
  end

  def update_stat(user_stats, user)
    user_stats.each do |user_stat|
      key = user_stat.keys
      game_name = user_stat[key[1]]
      stats = user_stat[key[2]]
      stats.each do |stat|
        type = key[2]
          Stat.update(gameName: game_name, genre: type, name: stat["name"], value: stat["value"], user: user)
      end
    end
  end
end
