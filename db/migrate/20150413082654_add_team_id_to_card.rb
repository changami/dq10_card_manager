class AddTeamIdToCard < ActiveRecord::Migration
  def change
    add_column :cards, :team_id, :integer
  end
end
