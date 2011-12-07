class RemoveJourpresentFromJours < ActiveRecord::Migration
  def up
    remove_column :jours, :jourpresent
    add_column :jours, :convocationjours_id, :int
  end

  def down
    add_column :jours, :jourpresent, :date
    remove_column :jours, :convocationjours_id
  end
end
