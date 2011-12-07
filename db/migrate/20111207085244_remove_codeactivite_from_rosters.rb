class RemoveCodeactiviteFromRosters < ActiveRecord::Migration
  def up
    remove_column :rosters, :codeactivite
  end

  def down
    add_column :rosters, :codeactivite, :int
  end
end
