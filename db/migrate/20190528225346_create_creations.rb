class CreateCreations < ActiveRecord::Migration[5.2]
  def change
    create_table :creations do |t|
      t.integer :destination_id
      t.integer :creator_id

      t.timestamps
    end
  end
end
