class CreateGroups < ActiveRecord::Migration[6.1]
  def change
    create_table :groups do |t|
      t.string :group_name
      t.string :email
      t.string :phone
      t.string :website
      t.text :logo

      t.timestamps
    end
    add_index :groups, :email, unique: true
  end
end
