class AddAvatarIntroductionToUsers < ActiveRecord::Migration[6.1]
  def change
      add_column :users, :introduction, :text #追記
      
  end
end
