class SteamController < ApplicationController
  skip_before_action :authenticate_user!

  def connect
    redirect_to "https://steamcommunity.com/openid/login?openid.mode=checkid_setup&openid.ns=http://specs.openid.net/auth/2.0&openid.identity=http://specs.openid.net/auth/2.0/identifier_select&openid.claimed_id=http://specs.openid.net/auth/2.0/identifier_select&openid.return_to=#{steam_callback_url}", allow_other_host: true
  end

  def callback
    steam_id = params['openid.claimed_id'].split('/').last
    ap steam_id
    user = User.find_or_create_by(steam_id: steam_id)
    ap user
    session['user_id'] = user.id
    ap session['user_id']
    redirect_to leagues_path
  end
end
