class CreateContentFiles < ActiveRecord::Migration[5.1]
  def change
    create_table :content_files do |t|
      t.references :content, foreign_key: true

      t.timestamps
    end
    add_attachment :content_files, :attachment
  end
end
