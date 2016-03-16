class CreateProblems < ActiveRecord::Migration
  def change
    create_table :problems do |t|
      t.text :problem
      t.text :plan
      t.integer :agree
      t.integer :user_id
      t.integer :team_id
      t.integer :done

      t.timestamps null: false
    end
  end
end
