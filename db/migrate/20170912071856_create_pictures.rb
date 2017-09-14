class CreatePictures < ActiveRecord::Migration[5.1]
  def change
    create_table :pictures do |t|
      t.string :type, null: false
      t.text :caption
      t.string :parent_type, null: false
      t.integer :parent_id, null: false
      t.integer :sort_order, default: 0, null: false
      t.string :image_fingerprint, null: false
      t.timestamps null: false
    end
    add_attachment :pictures, :image

    add_index :pictures, [:parent_id, :parent_type]
  end
end
