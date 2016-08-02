class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.text :body, null:false
      t.integer :ref_id, null: false
      t.string :ref_type, null: false

      t.timestamps null: false
    end
    add_index :comments, :ref_id
    add_index :comments, :ref_type
  end
end
