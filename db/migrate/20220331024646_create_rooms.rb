class CreateRooms < ActiveRecord::Migration[6.1]
  def change
    create_table :rooms do |t|
      t.string  :room_profile, :room_name, :room_address, :room_image
      t.integer :price

      t.timestamps
    end
  end
end
