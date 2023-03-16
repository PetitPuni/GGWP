class ApplicationController < ActionController::Base
  before_action :set_current_user
  before_action :authenticate_user!

  def authenticate_user!
    redirect_to steam_connect_path unless current_user
  end

  def set_current_user
    return unless session[:user_id]

    @current_user = User.find_by(id: session[:user_id])
  end

  def current_user
    @current_user
  end

  def default_url_options
    { host: ENV["DOMAIN"] || "localhost:3000" }
  end

  helper_method :current_user
end
