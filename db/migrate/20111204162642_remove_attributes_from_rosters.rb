class RemoveAttributesFromRosters < ActiveRecord::Migration
  def up
    remove_column :rosters, :harrivee
    remove_column :rosters, :hdepart
    remove_column :rosters, :datedebut
    remove_column :rosters, :datefin
  end

  def down
    add_column :rosters, :hdepart, :time
    add_column :rosters, :harrivee, :time
    add_column :rosters, :datedebut, :date
    add_column :rosters, :datefin, :date
  end
end
