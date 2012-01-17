class AddEncoursToMissions < ActiveRecord::Migration
  def change
    add_column :missions, :encours, :boolean
  end
end
