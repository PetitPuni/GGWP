class SteamController < ApplicationController
  skip_before_action :authenticate_user!

  def connect
    redirect_to "https://steamcommunity.com/openid/login?openid.mode=checkid_setup&openid.ns=http://specs.openid.net/auth/2.0&openid.identity=http://specs.openid.net/auth/2.0/identifier_select&openid.claimed_id=http://specs.openid.net/auth/2.0/identifier_select&openid.return_to=#{steam_callback_url}",
                allow_other_host: true
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
end

# pour chaque enter dans la table stat avec pgsearch si une entrée contient le current_user et stat['name'] alors update la valeur de la stat
# sinon créer une nouvelle entrée dans la table stat avec le current_user et la stat['name'] et la valeur de la stat['value']
