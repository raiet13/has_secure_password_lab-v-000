class UsersController < ApplicationController

  # Root/Welcome Page
  def index
    if !logged_in?
      redirect_to new_user_path
    end
  end

  # Log In Page
  def new
  end

  # User authentication
  def create
    # puts "params = #{params}"
    user = User.new(user_params)
		if user.save
      # puts "login successful"
      session[:user_id] = user.id
			redirect_to users_path
		else
      # puts "login failed"
			redirect_to new_user_path
		end
  end



  private

  def user_params
    params.require(:user).permit(:name, :password, :password_confirmation)
  end


  # NOTE : From sinatra-secure-password-lab-v-000 lab
  helpers do
    def logged_in?
      !!session[:user_id]
    end
  end

end
