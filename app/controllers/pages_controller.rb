class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [ :home ]

  def home
    ap "je suis dans #{__method__}"
    ap session
  end
end
