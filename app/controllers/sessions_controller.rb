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
	    if user = User.find_by_username(params[:username])
		  redirect_to_login "The password was incorrect."
		else
		  redirect_to_login "The username does not exist."
		end
	  end
	end
	
	def destroy
	  session[:user] = nil
	  redirect_to_login "Successful log out." 
	end
	
	private
	
	def redirect_to_login(message)
	  redirect_to login_path, :alert => message
	end
end