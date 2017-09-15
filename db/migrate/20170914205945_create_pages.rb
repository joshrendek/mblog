class CreatePages < ActiveRecord::Migration[5.1]
  def change
    create_table :pages do |t|
      t.string :title
      t.text :body
      t.string :slug
      t.string :state, default: 'draft'
      t.timestamps
    end
    add_index :pages, :slug
    add_index :pages, :state
  end
end
