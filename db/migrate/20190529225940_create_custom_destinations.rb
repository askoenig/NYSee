class CreateCustomDestinations < ActiveRecord::Migration[5.2]
  def change
    create_table :custom_destinations do |t|
      t.string :name
      t.string :address
      t.string :destination_type
      t.integer :year_created

      t.timestamps
    end
  end
end
