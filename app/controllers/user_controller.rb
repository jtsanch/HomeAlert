class UserController < ApplicationController
  def index

  end

  def create
  	@user = User.new(params[:login], params[:password])

  	@user.save

  	redirect_to @user
  end

  private 
  	def user_params
  		params.require(:user).permit(:login, :password)
  	end
end
