class UsersController < ApplicationController
  def set_user_type_form
  end

  def set_user_type

  end

  def check_user_type
    @transporter = Transporter.where(:user_id => current_user.id, :email => current_user.email).first
    @ngo = Ngo.find_by(:user_id => current_user.id)
    if @transporter.present?
      redirect_to user_dashboard_path(:transporter_id => @transporter)
    elsif @ngo.present?
      redirect_to user_dashboard_path(:ngo_id => @ngo)
    else
      redirect_to user_set_user_type_path, notice: "You haven't yet completed registration."
    end
  end

  def dashboard
    @region = Region.new
    if params[:ngo_id].present?
      @ngo = Ngo.find(params[:ngo_id])
      @added_regions = @ngo.regions
    elsif params[:transporter_id].present?
      @transporter = Transporter.find(params[:transporter_id])
      @added_regions = @transporter.regions
    end
  end
end
