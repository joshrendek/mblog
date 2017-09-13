class CreateSidebars < ActiveRecord::Migration[5.1]
  def change
    create_table :sidebars do |t|
      t.string :title
      t.integer :order
      t.text :body

      t.timestamps
    end
  end
end
