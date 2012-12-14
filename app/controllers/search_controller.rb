class SearchController < ApplicationController 
  def show
    @shops = Shop.like(params[:query])
  end
end