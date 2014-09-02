class CreateLineCards < ActiveRecord::Migration
  def change
    create_table :line_cards do |t|
      t.integer :card_id
      t.integer :team_id

      t.timestamps null: false
    end
  end
end
