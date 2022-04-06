class UsersController < ApplicationController
    before_action :authenticate_user!
  
  def show
      @user = current_user
  end
  
  def edit
    @user = User.find(params[:id])
  end

  def update
      @user = User.find(params[:id])
      if current_user == @user
        if @user.update params.require(:user).permit(:name, :introduction, :image)
          flash[:notice] = "更新しました"
          redirect_to "/users/profile"
        else
          flash[:notice] = "更新できませんでした"
          render "users/profile"
        end
      else
          redirect_to "/"
      end
  end
  
  def profile
     @user = current_user
  end
 
  def profile_update
      @user = User.find(params[:id])
        if @user.update(params.require(:user).permit( :name, :introdction, :image))
          flash[:notice]="プロフィールを更新しました"
          redirect_to controller: :users, action: :show
        else
          render "profile"
        end
   end

  private
  
  def user_params
    params.require(:user).permit(:name, :email, :introdction, :image)
  end

end
