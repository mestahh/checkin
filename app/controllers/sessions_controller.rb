class SessionsController < ApplicationController
	
	def new
		if session[:user]
		  redirect_to main_index_path
		end
	end
	
	def create
	  if user = User.authenticate(params[:username], params[:password])
        redirect_to main_index_path
		session[:user] = user
      else
        redirect_to login_path
	  end
	end
end