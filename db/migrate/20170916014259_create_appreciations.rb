class CreateAppreciations < ActiveRecord::Migration[5.1]
  def change
    create_table :appreciations do |t|
      t.references :content, foreign_key: true
      t.inet :ip_address

      t.timestamps
    end
    add_index :appreciations, [:content_id, :ip_address]
  end
end
