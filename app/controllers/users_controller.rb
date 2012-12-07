class UsersController < ApplicationController
  def new
  
  end
  
  def create
    @user = User.new
	@user.username = params[:username]
	@user.password = params[:password]
	@user.save
    redirect_to success_index_path
  end
	
end