class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:home]

  def home
    ap session
  end
end
