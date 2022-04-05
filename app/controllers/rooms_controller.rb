class RoomsController < ApplicationController
    
  def index
    @rooms = Room.all
    @user = current_user
    
  end
  
  def new
    @room = Room.new
    @user = current_user
  end
   
  def create
    @user = current_user
    @room = Room.new(params.require(:room).permit(:room_name, :room_profile, :room_address, :price, :room_image, :user_id))
    if @room.save
        flash[:notice] = "新しいルームを登録しました"
        redirect_to  :rooms
    else
        flash[:notice] = "全ての項目を入力してください"
        render "new"
    end
  end
   
  def show
      @room = Room.find(params[:id])
      @user = current_user
      @reservation = Reservation.new
      @reservation.total_price = @room.price
  end
   
  def edit
    @room = Room.find(params[:id])
    @user = current_user
  end
   
  def update
    @room = Room.find(params[:id])
      if @room.update(params.require(:room).permit(:room_name, :room_profile, :room_address, :room_image, :price))
        flash[:notice] = "ルーム情報を更新しました"
        redirect_to :rooms
      else
        render "edit"
      end
  end
   
  def destroy
    @room = Room.find(params[:id])
    @room.destroy
    flash[:notice] = "ルームを削除しました"
    redirect_to :rooms
  end
  
  def search
    @user = current_user
    @rooms = Room.search(params[:search],params[:address])
  end
  
  private
  
  def room_params
    params.require(:room).permit(:room_name, :room_address, :room_profile, :room_image, :price, :room_id)
  end
 end
