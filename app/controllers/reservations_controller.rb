class ReservationsController < ApplicationController
  
  def index
    @reservations = Reservation.find_all_by_user_id session[:user]
  end
  
  def new
    @shop = Shop.find(params[:shop_id])
    @service = Service.find(params[:service])
    unless session[:user]
      redirect_to service_path(@service.id)
    end
  end
  
  def create
    
    if overlaps_with? params[:start_time], params[:shop_id]
      redirect_to error_index_path, :alert => 'The reservation overlaps with another one. Please choose anoter start time.'
    else
      service = Service.find(params[:service_id])
      
      @reservation = Reservation.new
      @reservation.start_time = params[:start_time]
      @reservation.user_id = session[:user].id
      @reservation.service_id = service.id
      @reservation.shop_id = params[:shop_id]
      @reservation.save
      redirect_to reservations_path(:shop_id => params[:shop_id]) 
    end
    
  end
  
  def destroy
    reservation = Reservation.find(params[:reservation_id])
    reservation.delete
    redirect_to reservations_path(:shop_id => params[:shop_id])
  end
  
  private
  
  def overlaps_with?(start_time, shop_id)

    reservations = Reservation.find_all_by_shop_id shop_id
  
    if reservations.length == 0
      return false
    end
    
    reservations.each do |res| 
      
      if (res.start_time < start_time && (res.start_time + + res.service.length.minutes > start_time))
          return true
      end      
    end
    
    return false
  end
end