class SessionsController < ApplicationController
	
	def new
	
	end
	
	def create
	  if user = User.authenticate(params[:username], params[:password])
        redirect_to main_index_path
      else
        redirect_to login_path
	  end
	end
end