class AddTeamIdToUsers < ActiveRecord::Migration
  def change
  	add_column :users, :name, :string
  	add_column :users, :role, :string
  	add_column :users, :point, :integer
  	add_column :users, :team_id, :integer
  	add_column :users, :problem_id, :integer
  end
end
