class UsersController < ApplicationController

  before_filter :trans , :only => [:dashboard]

  def set_user_type_form
  end

  def set_user_type

  end

  def check_user_type
    @transporter = Transporter.where(:user_id => current_user.id, :email => current_user.email).first
    @ngo = Ngo.find_by(:user_id => current_user.id)
    if current_user.has_role?
      redirect_to user_dashboard_path
    end
  end

  def dashboard

    @region = Region.new
    @transporter = Transporter.where(:email => current_user.email).first
    @added_regions = @transporter.regions
  end

  def ngo
    @region = Region.new
    @ngo = Notifier.where(:email => current_user.email).collect{|x| x.ngo}.first
    @added_regions = @ngo.regions
  end

  def trans
    redirect_to "/transporters/new" if Transporter.where(:email => current_user.email).blank?
  end
end
