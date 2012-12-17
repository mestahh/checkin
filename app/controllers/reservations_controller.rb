class ReservationsController < ApplicationController
  
  def index
    @reservations = Reservation.find(:all)
  end
  
  def new 
    @service = Service.find(params[:service])
  end
  
  def create
    
    if overlaps_with? params[:start_time], params[:service_id]
      redirect_to error_index_path, :alert => 'The reservation overlaps with another one. Please choose anoter start time.'
    else
      service = Service.find(params[:service_id])
      
      @reservation = Reservation.new
      @reservation.start_time = params[:start_time]
      @reservation.user_id = session[:user].id
      @reservation.service_id = service.id
      @reservation.save
      redirect_to reservations_path 
    end
    
  end
  
  private
  
  def overlaps_with?(start_time, service_id)

    reservations = Reservation.find_all_by_service_id service_id
    service = Service.find service_id
  
    if reservations.length == 0
      return false
    end
    
    reservations.each do |res| 
      if (res.start_time < start_time && (res.start_time + + service.length.minutes > start_time))
          return true
      end      
    end
    
    return false
  end
end