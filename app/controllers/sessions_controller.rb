class SessionsController < ApplicationController
	
	def new
		if session[:user]
		  redirect_to main_index_path
		end
	end
	
	def create
	  if user = User.authenticate(params[:username], params[:password])
	    session[:user] = user
	    redirect_to main_index_path
	  else
	    redirect_to login_path, :alert => "The password was incorrect."
	  end
	end
	
	def destroy
	  session[:user] = nil
	  redirect_to login_path, :alert => "Successful log out." 
	end
end