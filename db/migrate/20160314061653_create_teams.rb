class CreateTeams < ActiveRecord::Migration
  def change
    create_table :teams do |t|
      t.string :name
      t.integer :problem_id
      t.text :detail
      t.timestamps null: false
    end
  end
end
