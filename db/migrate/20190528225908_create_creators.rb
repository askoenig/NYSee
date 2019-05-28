class CreateCreators < ActiveRecord::Migration[5.2]
  def change
    create_table :creators do |t|
      t.string :first_name
      t.string :last_name
      t.string :occupation
      t.integer :year_born
      t.integer :year_died

      t.timestamps
    end
  end
end
