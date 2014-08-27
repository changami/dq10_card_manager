class CreateCards < ActiveRecord::Migration
  def change
    create_table :cards do |t|
      t.string :name
      t.integer :remaining_hour
      t.string :own_player

      t.timestamps null: false
    end
  end
end
