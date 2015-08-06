class UsersController < ApplicationController
  def index

  end

  def show

  end

  def new
  	@user = User.new
  end

  def create
  	@user = User.new(user_params)

  	if @user.save
  	  	session[:user_id] = @user.id
  	  	redirect_to @user
  	  else
  	  	flash[:notice] = "Incorrect username/password"
  	  	render "new"
  	end
  end

  private 
  	def user_params
  		params.require(:user).permit(:login, :password)
  	end
end
