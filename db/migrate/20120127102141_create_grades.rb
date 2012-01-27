class CreateGrades < ActiveRecord::Migration
  def change
    create_table :grades do |t|
      t.string :nom
      t.references :corp
    end
  end
end
