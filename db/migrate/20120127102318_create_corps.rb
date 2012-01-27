class CreateCorps < ActiveRecord::Migration
  def change
    create_table :corps do |t|
      t.string :nom
    end
  end
end
