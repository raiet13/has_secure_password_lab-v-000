class SessionsController < ApplicationController

  def create
    # puts "params = #{params}"
    user = User.find_by(name: params[:user][:name])
    if user && user.authenticate(params[:user][:password])
      session[:user_id] = user.id
      redirect_to users_path
    else
      flash[:alert] = "You must be logged in"
      redirect_to new_user_path
    end
  end

end
