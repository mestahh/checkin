class ShopsController < ApplicationController
  def show
    @services = Service.find(:all)
  end
end