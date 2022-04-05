class RemoveNemberOfPeopleFromReservation < ActiveRecord::Migration[6.1]
  def change
    remove_column :reservations, :nember_of_people, :integer
  end
end
