class ChangeNameOfContactTable < ActiveRecord::Migration
  def change
    drop_table :contact

    create_table :contacts do |t|
      t.integer :company_id
      t.string :name
      t.string :login
      t.string :password
      t.string :email
      t.string :phone

      t.timestamps
    end
  end
end
