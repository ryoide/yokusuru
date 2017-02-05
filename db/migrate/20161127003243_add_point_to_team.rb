class AddPointToTeam < ActiveRecord::Migration
  def change
    add_column :teams, :point, :integer
  end
end
