class RemoveGrademauvaisereferenceToUsers < ActiveRecord::Migration
  def up
    remove_column :users, :grade
  end

  def down
    add_column :users, :grade, :integer
  end
end
