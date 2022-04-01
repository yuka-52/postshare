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
    @room = Room.new(params.require(:room).permit(:room_name, :room_profile, :room_address, :price, :room_image))
    binding.pry
      if @room.save
          binding.pry
          flash[:notice] = "ルームを新規登録しました"
          redirect_to :rooms
      else
        flash[:alert] = "全ての項目を入力してください"
        render "new"
      end
  end
   
  def show
    @room = Room.find(params[:id])
  end
   
  def edit
  end
   
  def update
  end
   
  def destroy
  end
   
  private
   
   def user_params
     params.require(:room).permit(:room_name, :room_address, :room_profile, :room_image, :price)
   end

 end
