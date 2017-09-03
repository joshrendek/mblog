class AddStateToContents < ActiveRecord::Migration[5.1]
  def change
    add_column :contents, :state, :string, default: 'draft'
    add_index :contents, :state
  end
end
