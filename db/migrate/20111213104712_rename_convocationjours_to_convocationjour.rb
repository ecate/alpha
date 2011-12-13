class RenameConvocationjoursToConvocationjour < ActiveRecord::Migration
  def up
    rename_table :convocationjours, :convocationjour
  end

  def down
    rename_table :convocationjour, :convocationjours
  end
end
