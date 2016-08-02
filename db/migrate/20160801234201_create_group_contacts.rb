class CreateGroupContacts < ActiveRecord::Migration
  def change
    create_table :group_contacts do |t|
      t.integer :contact_id
      t.integer :group_id

      t.timestamps null: false
    end
    add_index :group_contacts, :contact_id
    add_index :group_contacts, :group_id
  end
end
