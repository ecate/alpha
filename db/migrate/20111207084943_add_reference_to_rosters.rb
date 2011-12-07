class AddReferenceToRosters < ActiveRecord::Migration
  def change
    add_column :rosters, :mission_id, :int
  end
end
