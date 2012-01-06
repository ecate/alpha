class AddCodeToMissions < ActiveRecord::Migration
  def change
    add_column :missions, :code_activite, :integer
  end
end
