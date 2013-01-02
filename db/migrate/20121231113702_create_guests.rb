class CreateGuests < ActiveRecord::Migration
  def change
    create_table :guests do |t|
      t.string :firstname
      t.string :lastname
      t.string :email
      t.text :resume
      t.references :event

      t.timestamps
    end
    add_index :guests, :event_id
  end
end
