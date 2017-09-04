class CreateMenus < ActiveRecord::Migration[5.1]
  def change
    create_table :menus do |t|
      t.string :name
      t.string :target
      t.integer :order

      t.timestamps
    end
  end
end
