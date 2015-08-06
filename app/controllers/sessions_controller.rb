class SessionsController < ApplicationController
  
  def new
  end
  
  def create
  	user = User.authenticate(params[:login], params[:password])
  	if user
  		session[:user_id] = user.id
  		redirect_to root_url, :notice => "Logged in!"
  	else
  		redirect_to log_in, :notice => "Wrong email or password!"
  	end
  end

  def current_user
  	@current_user ||= session[:user_id] && User.find_by(id: session[:user_id])
  end
end
