class CreateJours < ActiveRecord::Migration
  def change
    create_table :jours do |t|
      t.references :roster
      t.date :jourpresent
      t.timestamps
    end
  end
end
