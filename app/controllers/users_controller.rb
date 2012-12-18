class UsersController < ApplicationController
  def new
  
  end
  
  def edit
	  @user = User.find(params[:id])
    unless session[:user] == @user
      redirect_to error_index_path, :alert => "You can't edit another user's data"
    end
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
  
  def update
    @user = User.find(params[:user_id])
	  @user.username = params[:username]
	  @user.password = params[:password]
	  @user.save
    redirect_to success_index_path
  end
	
end