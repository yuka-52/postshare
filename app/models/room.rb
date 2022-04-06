class Room < ApplicationRecord
    validates :room_name, presence: true
    validates :room_profile, length: { maximum: 400 }, presence: true
    validates :room_address, presence: true
    validates :price, presence: true ,numericality: true
    validates :room_image, presence: true
    
    mount_uploader :room_image, RoomImageUploader
    has_many :reserations
    belongs_to :user
  
  def self.search(search,address)
    if address
      @rooms = Room.where(["room_address LIKE ?", "%#{address}%"])
    elsif search
      @rooms = Room.where(["room_address LIKE ? OR room_name LIKE ? OR room_profile LIKE ?","%#{search}%","%#{search}%","%#{search}%"])
    else
      @rooms = Room.all
    end
  end
end
