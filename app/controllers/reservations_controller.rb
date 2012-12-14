class ReservationsController < ApplicationController
  
  def index
    @reservations = Reservation.find(:all)
  end
  
  def new 
    @service = Service.find(params[:service])
  end
  
  def create
    redirect_to reservations_path
  end
  
end