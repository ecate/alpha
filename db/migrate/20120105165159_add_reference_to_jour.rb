class AddReferenceToJour < ActiveRecord::Migration
  def up
    rename_column :jours, :convocationjours_id, :convocationjour_id
  end
  def down
    rename_column :jours, :convocationjour_id, :convocationjours_id
  end
end
