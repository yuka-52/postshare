class User < ApplicationRecord
  
    # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
         
  validates :name, presence: true #追記
  validates :introduction, length: { maximum: 200 } #追記
  attr_accessor :current_password
  
  mount_uploader :image, AvatarUploader
  has_many :rooms
  has_many :reservations, dependent: :destroy
  
  def update_without_current_password(params, *options)
      if params[:password].blank? && params[:password_confirmation].blank?
        params.delete(:password)
        params.delete(:password_confirmation)
      end

      result = update(params, *options)
      clean_up_passwords
      result
    end
end
