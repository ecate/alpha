class RenameConvocationjourToConvocationjours < ActiveRecord::Migration
  def up
    rename_table :convocationjour, :convocationjours
  end

  def down
    rename_table :convocationjours, :convocationjour
  end
end
