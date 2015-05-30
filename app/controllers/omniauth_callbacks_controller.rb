class OmniauthCallbacksController < Devise::OmniauthCallbacksController


  def facebook
    #hey_wait
    omniauth = request.env['omniauth.auth']
    @user = User.find_by facebook_uid: omniauth.uid
    if @user
      p "user found"
      p "signing in user in if"
      sign_in_and_redirect @user, :event => :authentication
      #redirect_to root_path , notice: "Connected #{omniauth.provider} successfully"
    else
      # User.create(:name => omniauth.extra[:raw_info][:name], :email => omniauth.extra[:raw_info][:name], )
      # Provider.create()
      #session["devise.facebook_data"] = request.env["omniauth.auth"]
      #hey_wait
      #redirect_to new_user_registration_url
      p "Creating user........"
      @user = User.create!({:email => omniauth["info"]["email"], :password => "00000000", :password_confirmation => "00000000" })
      p @user
      @user.update(:name => omniauth["info"]["name"], :facebook_token => omniauth["credentials"]["token"], :facebook_uid => omniauth["uid"])
      p "Updating user......."
      p @user
      p "signing in user in else"
      sign_in_and_redirect @user, :event => :authentication
    end
  end

end
