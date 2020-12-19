class CreateGroupHasManagers < ActiveRecord::Migration[6.1]
  def change
    create_table :group_has_managers do |t|
      t.references :group, null: false, foreign_key: true
      t.references :user, null: false, foreign_key: true
      t.timestamps
    end
  end
end
