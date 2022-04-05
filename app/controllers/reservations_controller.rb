class ReservationsController < ApplicationController
    before_action :authenticate_user!
  def index
    @rooms = Room.all
    @reservations = Reservation.all
    @user = current_user
  end

  def new
    @reservations = Reservation.new
  end

  def create
    @reservation = Reservation.new(params.require(:reservation).permit(:start_date, :end_date, :total_price, :number_of_people, :total_days, :user_id, :room_id))
    if @reservation.save
      flash[:notice] = "予約を受け付けました。"
      redirect_to  @reservation
    else
      render "posts"
    end
  end

  def show
      @user = current_user
      @reservation = Reservation.find(params[:id])
  end

  def edit
  end

  def update
  end

  def destroy
  end


  def confirm
    @user = current_user
    @reservation = Reservation.new(reservation_params)
    @reservation.total_days = (@reservation.end_date - @reservation.start_date ).to_i
    @room = @reservation.room
    @reservation.total_price = @room.price*@reservation.number_of_people*@reservation.total_days
  end

private
      
  def reservation_params
    params.require(:reservation).permit(:start_date, :end_date, :total_price, :number_of_people, :total_days, :user_id, :room_id)
  end

end
