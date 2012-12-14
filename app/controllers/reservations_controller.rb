class ReservationsController < ApplicationController
  
  def index
    @reservations = Reservation.find(:all)
  end
  
  def new 
    @service = Service.find(params[:service])
  end
  
  def create
    @reservation = Reservation.new
	@reservation.start_time = params[:start_time]
	@reservation.user_id = session[:user].id
	@reservation.service_id = params[:service_id]
	@reservation.save
    redirect_to reservations_path
  end
  
end