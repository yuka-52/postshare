class Room < ApplicationRecord
    validates :room_name, presence: true
    validates :room_profile, length: { maximum: 400 }, presence: true
    validates :room_address, presence: true
    validates :price, presence: true ,numericality: true
    validates :room_image, presence: true
    
    mount_uploader :room_image, RoomImageUploader
end
