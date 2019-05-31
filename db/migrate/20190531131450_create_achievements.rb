class CreateAchievements < ActiveRecord::Migration[5.2]
  def change
    create_table :achievements do |t|
      t.string :name
      t.string :img_url
      t.integer :user_id
    end
  end
end
