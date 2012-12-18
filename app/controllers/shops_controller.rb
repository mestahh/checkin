class ShopsController < ApplicationController
  def show
    @shop = Shop.find(params[:id])
    @services = Service.find(:all)
  end
end