class CreateContacts < ActiveRecord::Migration
  def change
    create_table :contacts do |t|
      t.string :name
      t.string :mail
      t.string :subject
      t.text   :content

      t.timestamps null: false
    end
  end
end
