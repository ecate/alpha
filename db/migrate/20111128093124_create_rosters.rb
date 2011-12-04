class CreateRosters < ActiveRecord::Migration
  def change
    create_table :rosters do |t|
      t.integer :codeactivite
      t.integer :user_id
      t.date :datedebut
      t.date :datefin

      t.timestamps
    end
  end
end
