class CreateCustomVisits < ActiveRecord::Migration[5.2]
  def change
    create_table :custom_visits do |t|
      t.integer :user_id
      t.integer :custom_destination_id

      t.timestamps
    end
  end
end
