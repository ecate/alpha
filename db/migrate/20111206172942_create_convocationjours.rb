class CreateConvocationjours < ActiveRecord::Migration
  def change
    create_table :convocationjours do |t|
      t.references :mission
      t.date :jourconvoc

      t.timestamps
    end
  end
end
