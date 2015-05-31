class HomeController < ApplicationController
  #before_action :authenticate_user!
  layout "guest_user"
  def index
  end
end
