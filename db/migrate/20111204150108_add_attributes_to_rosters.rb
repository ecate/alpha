class AddAttributesToRosters < ActiveRecord::Migration
  def change
    add_column :rosters, :convoc, :boolean
    add_column :rosters, :but, :boolean
    add_column :rosters, :butvilledepart, :string
    add_column :rosters, :harrivee, :time
    add_column :rosters, :hdepart, :time
    add_column :rosters, :comment, :text
  end
end
