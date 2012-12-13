class ReservationsController < ApplicationController
  def new 
    @service = Service.find(params[:service])
  end
end