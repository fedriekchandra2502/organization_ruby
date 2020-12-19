class CreateGroupHasPics < ActiveRecord::Migration[6.1]
  def change
    create_table :group_has_pics do |t|
      t.string :pic_name
      t.string :email
      t.string :phone
      t.string :avatar
      t.references :group, null: false, foreign_key: true

      t.timestamps
    end
  end
end
