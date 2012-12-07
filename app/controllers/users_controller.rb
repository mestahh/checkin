class UsersController < ApplicationController
  def new
  
  end
  
  def create
	if user = User.find_by_username(params[:username])
	  redirect_to error_index_path
	else
      @user = User.new
	  @user.username = params[:username]
	  @user.password = params[:password]
	  @user.save
      redirect_to success_index_path
	end
  end
	
end