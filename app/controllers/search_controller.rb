class SearchController < ApplicationController 
  def show
    @providers = Provider.like(params[:query])
  end
end