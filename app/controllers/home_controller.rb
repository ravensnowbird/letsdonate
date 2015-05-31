class HomeController < ApplicationController
  #before_action :authenticate_user!
  skip_before_filter :authenticate_user!
  layout "guest_user"
  def index
  end
end
