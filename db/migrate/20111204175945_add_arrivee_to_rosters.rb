class AddArriveeToRosters < ActiveRecord::Migration
  def change
    add_column :rosters, :harrivee, :datetime
    add_column :rosters, :hdepart, :datetime
  end
end
