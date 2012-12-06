class SessionsController < ApplicationController
	def new
	
	end
	
	def create
	  redirect_to main_index_path
	end
end