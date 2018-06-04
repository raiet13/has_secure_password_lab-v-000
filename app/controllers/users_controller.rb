class UsersController < ApplicationController

  # Root/Welcome Page
  def index
    if !logged_in?
      redirect_to "/new"
    end
  end

  # Log In Page
  def new
  end

  # User authentication
  def create
    puts "params = #{params}"
    user = User.new(name: params[:user][:name], password: params[:user][:password])
		if user.save
			redirect_to "/index"
		else
			redirect_to "/new"
		end
  end



  private

  # NOTE : From sinatra-secure-password-lab-v-000 lab
  helpers do
    def logged_in?
      !!session[:user_id]
    end

    def current_user
      User.find(session[:user_id])
    end
  end

end
