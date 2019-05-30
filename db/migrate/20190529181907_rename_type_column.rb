class RenameTypeColumn < ActiveRecord::Migration[5.2]
  def change
    rename_column :destinations, :type, :destination_type

  end
end
