class AddDatesToProblem < ActiveRecord::Migration
  def change
    add_column :problems, :status, :integer
    add_column :problems, :suggest, :date
    add_column :problems, :doing, :date
    add_column :problems, :finish, :date
  end
end
